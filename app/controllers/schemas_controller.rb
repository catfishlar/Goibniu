class SchemasController < ApplicationController
  respond_to :html, :json
  before_action :set_schema, only: [:show, :edit, :update, :destroy]

  # GET /schemas
  # GET /schemas.json
  def index
    @schemas = Schema.all
  end

  # GET /schemas/1
  # GET /schemas/1.json
  def show
    respond_with(@schema) do |format|
      format.json { render json: @schema.to_json }
    end
  end

  # GET /schemas/new
  def new
    @schema = Schema.new
  end

  # GET /schemas/1/edit
  def edit
  end

  # POST /schemas
  # POST /schemas.json
  def create
    @schema = Schema.new(schema_params)

    respond_to do |format|
      if @schema.save
        format.html { redirect_to @schema, notice: 'Schema was successfully created.' }
        format.json { render :show, status: :created, location: @schema }
      else
        format.html { render :new }
        format.json { render json: @schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schemas/1
  # PATCH/PUT /schemas/1.json
  def update
    respond_to do |format|
      if @schema.update(schema_params)
        format.html { redirect_to @schema, notice: 'Schema was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema }
      else
        format.html { render :edit }
        format.json { render json: @schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemas/1
  # DELETE /schemas/1.json
  def destroy
    @schema.destroy
    respond_to do |format|
      format.html { redirect_to schemas_url, notice: 'Schema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #This is called from a form on show.html.erb
  def upload
    @schema = Schema.find(params[:id])
    uploaded_io = params[:table_file]
    version_name = params[:version]
    file_name = Rails.root.join('public', 'uploads', uploaded_io.original_filename).to_s

    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
      file.close
    end
    fh = File.open(file_name, 'r')

    # this is based on a call like
    # mysqldump -h 10.0.249.151 -u lmurdock -p --no-data --single-transaction uptilt_db > schema.sql
    #
    # first line should be
    #-- MySQL dump 10.13  Distrib 5.6.12, for osx10.8 (x86_64)
    re = /MySQL dump\s+(\S+)\s+Distrib\s+(.*)/
    line = fh.gets
    m = re.match(line)
    if m #found a match
      schema_version = @schema.schema_versions.build(version: version_name, mysql_dump: m[1], mysql_distrib: m[2], comment: file_name)
      while line do # process tables
        #CREATE TABLE `Billing_Suppression_Table` (
        re = /^CREATE TABLE `(.*)`/
        line = fh.gets until line.nil? || m = re.match(line)
        if line # ie. found a table
          schema_table = schema_version.schema_tables.build(name: m[1])
          # - next fields
          field = true
          #  `TYPE` varchar(255) NOT NULL DEFAULT '',
          re = /^  `([^`]*)`\s(\w+)(\((\w+)\)|)/ # 1 = field name, 2 = field_type, 4 = size
          while field do # process fields
            line = fh.gets.chomp
            if m = re.match(line)
              # process a field
              nullable = (line =~ /NOT NULL/ ? false : true )
              match_default=/DEFAULT\s+'(.*)'/.match(line)
              default = ( match_default ? match_default[1] : nil)
              schema_table.schema_fields.build(name: m[1], field_type: m[2], type_params: m[4], nullable: nullable, default: default)
            else
              field = false
            end
          end # fields
          while /^\s+\w*\s*KEY/.match(line) do
            # process a key
            #  UNIQUE KEY `idx_sidcycle` (`SITE_ID`,`CYCLESTARTDATE`)
            #  PRIMARY KEY (`AUTOMATOR_TASK_ID`,`MESSAGE_ID`,`STAT_DATE`,`SITE_ID`,`MAILING_LIST_ID`)
            #  KEY `Automator_Payload_Email_Daily_Stat_IDX_01` (`SITE_ID`,`STAT_DATE`)
            primary = (line =~ /^\s+PRIMARY/ ? true : false)
            unique = (line =~ /^\s+UNIQUE/ ? true : false)
            name = ''
            key_list = ''
            if primary
              m = /\((.*)\)/.match(line)
              name = 'PRIMARY'
              key_list = m[1]

            else
              m = /`(\S*)`\s+\((.*)\)/.match(line)
              name = m[1]
              key_list = m[2]

            end
            key_list = key_list.scan(/[^`,]+/) # assumes that the list is ` and , seperated fields with no white space
            schema_key = schema_table.schema_keys.build(name: name, primary: primary, unique: unique)
            for i in 0..key_list.size - 1 do
              schema_key.schema_key_fields.build(name: key_list[i], order: i)
            end

            line = fh.gets
          end # loop over key lines
          if /^\)/ !~ line
            logger.error = "Something other than an end of table was found after a line inside a table that was not a field or a key.  Line is:"
            logger.error = "|#{line}|"
          end
        end # a single table
      end # table while
      @schema.save
    else
      logger.error = "File starts with something other than '-- MySQL dump' Line is:"
      logger.error = "|#{line}|"
    end
    fh.close
    redirect_to schema_path, notice: "File uploaded as #{file_name}"
  end

  # upload


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_schema
    @schema = Schema.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schema_params
    params.require(:schema).permit(:name)
  end

end

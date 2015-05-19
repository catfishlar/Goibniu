class DbStatusesController < ApplicationController
  before_action :set_db_status, only: [:show, :edit, :update, :destroy]

  # GET /db_statuses
  # GET /db_statuses.json
  def index
    @db_statuses = DbStatus.all
  end

  # GET /db_statuses/1
  # GET /db_statuses/1.json
  def show
  end

  # GET /db_statuses/new
  def new
    @db_status = DbStatus.new
  end

  # GET /db_statuses/1/edit
  def edit
  end

  # POST /db_statuses
  # POST /db_statuses.json
  def create
    @db_status = DbStatus.new(db_status_params)

    respond_to do |format|
      if @db_status.save
        format.html { redirect_to @db_status, notice: 'Db status was successfully created.' }
        format.json { render :show, status: :created, location: @db_status }
      else
        format.html { render :new }
        format.json { render json: @db_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /db_statuses/1
  # PATCH/PUT /db_statuses/1.json
  def update
    respond_to do |format|
      if @db_status.update(db_status_params)
        format.html { redirect_to @db_status, notice: 'Db status was successfully updated.' }
        format.json { render :show, status: :ok, location: @db_status }
      else
        format.html { render :edit }
        format.json { render json: @db_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /db_statuses/1
  # DELETE /db_statuses/1.json
  def destroy
    @db_status.destroy
    respond_to do |format|
      format.html { redirect_to db_statuses_url, notice: 'Db status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #This is called from a form on show.html.erb
  def upload
    @db_status = DbStatus.find(params[:id])
    uploaded_io = params[:table_file]
    file_name = Rails.root.join('public', 'uploads', uploaded_io.original_filename)

    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
      file.close
    end
    fh = File.open(file_name,'r')

    # this is based on a call like
    # mysql -h 10.0.249.151 -u lmurdock -p uptilt_db -B  -e "show table status" > uptilt_table_status_dec_4_2014.txt
    #
    # which produces:
    #
    #Name	Engine	Version	Row_format	Rows	Avg_row_length	Data_length	Max_data_length	Index_length	Data_free	Auto_increment	Create_time	Update_time	Check_time	Collation	Checksum	Create_options	Comment
    #API_Catalog	InnoDB	10	Compressed	59	138	8192	0	8192	0	NULL	2014-07-17 11:16:20	NULL	NULL	latin1_swedish_ci	NULL	row_format=COMPRESSED
    names = fh.gets.scan(/\S+/).map { |w| w.downcase.to_sym }
    fh.each_line do |line|
      table_values = line.scan(/[\S ]+/).map { |w| (w=="NULL" ? nil: w) }  # needed to add space in the regex to capture "2014-07-14 21:44:20" as a single field
      table_hash = Hash[names.zip table_values]
      @db_status.table_statuses.build(table_hash)
    end
    @db_status.note += " loaded #{file_name}"
    @db_status.save
    fh.close
    redirect_to db_status_path, notice: "File uploaded as #{file_name}"
=begin
  TableStatus
  db_status_id:integer
  name:string
  engine:string
  version:string
  row_format:string
  rows:integer
  avg_row_length:integer
  data_length:integer
  max_data_length:integer
  index_length:integer
  data_free:integer
  auto_increment:string
  create_time:datetime
  update_time:datetime
  check_time:datetime
  collation:string
  checksum:string
  create_options:string
  comment:string
  { "name:"Mailing_List_Autoload_Table",
    "engine": "InnoDB",
    "version": "10",
    "row_format": "Compressed",
    "rows": "0",
    "avg_row_length": "0",
    "data_length": "8192",
    "max_data_length": "0",
    "index_length": "8192",
    "data_free": "0",
    "auto_increment": "NULL",
    "create_time": "2014-07-14 21:44:20",
    "update_time": "NULL",
    "check_time": "NULL",
    "collation": "latin1_swedish_ci",
    "checksum": "NULL",
    "create_options": "row_format=COMPRESSED",
    "comment": null }
  }, is processed in uptilt/bin/gen_status_json

=end
end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_db_status
      @db_status = DbStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def db_status_params
      params.require(:db_status).permit(:database_id, :request_date, :note)
    end
end

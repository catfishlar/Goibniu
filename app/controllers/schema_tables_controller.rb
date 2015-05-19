class SchemaTablesController < ApplicationController
  before_action :set_schema_table, only: [:show, :edit, :update, :destroy]

  # GET /schema_tables
  # GET /schema_tables.json
  def index
    @schema_tables = SchemaTable.all
  end

  # GET /schema_tables/1
  # GET /schema_tables/1.json
  def show
  end

  # GET /schema_tables/new
  def new
    @schema_table = SchemaTable.new
  end

  # GET /schema_tables/1/edit
  def edit
  end

  # POST /schema_tables
  # POST /schema_tables.json
  def create
    @schema_table = SchemaTable.new(schema_table_params)

    respond_to do |format|
      if @schema_table.save
        format.html { redirect_to @schema_table, notice: 'Schema table was successfully created.' }
        format.json { render :show, status: :created, location: @schema_table }
      else
        format.html { render :new }
        format.json { render json: @schema_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schema_tables/1
  # PATCH/PUT /schema_tables/1.json
  def update
    respond_to do |format|
      if @schema_table.update(schema_table_params)
        format.html { redirect_to @schema_table, notice: 'Schema table was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema_table }
      else
        format.html { render :edit }
        format.json { render json: @schema_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schema_tables/1
  # DELETE /schema_tables/1.json
  def destroy
    @schema_table.destroy
    respond_to do |format|
      format.html { redirect_to schema_tables_url, notice: 'Schema table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema_table
      @schema_table = SchemaTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_table_params
      params.require(:schema_table).permit(:name, :schema_version_id)
    end
end

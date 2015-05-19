class TableStatusesController < ApplicationController
  before_action :set_table_status, only: [:show, :edit, :update, :destroy]

  # GET /table_statuses
  # GET /table_statuses.json
  def index
    @table_statuses = TableStatus.all
  end

  # GET /table_statuses/1
  # GET /table_statuses/1.json
  def show
  end

  # GET /table_statuses/new
  def new
    @table_status = TableStatus.new
  end

  # GET /table_statuses/1/edit
  def edit
  end

  # POST /table_statuses
  # POST /table_statuses.json
  def create
    @table_status = TableStatus.new(table_status_params)

    respond_to do |format|
      if @table_status.save
        format.html { redirect_to @table_status, notice: 'Table status was successfully created.' }
        format.json { render :show, status: :created, location: @table_status }
      else
        format.html { render :new }
        format.json { render json: @table_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_statuses/1
  # PATCH/PUT /table_statuses/1.json
  def update
    respond_to do |format|
      if @table_status.update(table_status_params)
        format.html { redirect_to @table_status, notice: 'Table status was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_status }
      else
        format.html { render :edit }
        format.json { render json: @table_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_statuses/1
  # DELETE /table_statuses/1.json
  def destroy
    @table_status.destroy
    respond_to do |format|
      format.html { redirect_to table_statuses_url, notice: 'Table status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_status
      @table_status = TableStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_status_params
      params.require(:table_status).permit(:db_status_id, :name, :engine, :version, :row_format, :rows, :avg_row_length, :data_length, :max_data_length, :index_length, :data_free, :auto_increment, :create_time, :update_time, :check_time, :collation, :checksum, :create_options, :comment)
    end
end

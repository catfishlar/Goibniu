class SchemaVersionsController < ApplicationController
  respond_to :html, :json
  before_action :set_schema_version, only: [:show, :edit, :update, :destroy, :full]

  # GET /schema_versions
  # GET /schema_versions.json
  def index
    @schema_versions = SchemaVersion.all
  end

  # GET /schema_versions/1
  # GET /schema_versions/1.json
  def show
  end

  # GET /schema_versions/1/full
  # GET /schema_versions/1/full.json
  def full
    respond_with(@schema_version) do |format|
      format.json { render json: @schema_version.full }
    end
  end

  # GET /schema_versions/new
  def new
    @schema_version = SchemaVersion.new
  end

  # GET /schema_versions/1/edit
  def edit
  end

  # POST /schema_versions
  # POST /schema_versions.json
  def create
    @schema_version = SchemaVersion.new(schema_version_params)

    respond_to do |format|
      if @schema_version.save
        format.html { redirect_to @schema_version, notice: 'Schema version was successfully created.' }
        format.json { render :show, status: :created, location: @schema_version }
      else
        format.html { render :new }
        format.json { render json: @schema_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schema_versions/1
  # PATCH/PUT /schema_versions/1.json
  def update
    respond_to do |format|
      if @schema_version.update(schema_version_params)
        format.html { redirect_to @schema_version, notice: 'Schema version was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema_version }
      else
        format.html { render :edit }
        format.json { render json: @schema_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schema_versions/1
  # DELETE /schema_versions/1.json
  def destroy
    @schema_version.destroy
    respond_to do |format|
      format.html { redirect_to schema_versions_url, notice: 'Schema version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema_version
      @schema_version = SchemaVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_version_params
      params.require(:schema_version).permit(:schema_id, :version, :mysql_dump, :mysql_distrib, :comment)
    end
end

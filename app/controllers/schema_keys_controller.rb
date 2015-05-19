class SchemaKeysController < ApplicationController
  before_action :set_schema_key, only: [:show, :edit, :update, :destroy]

  # GET /schema_keys
  # GET /schema_keys.json
  def index
    @schema_keys = SchemaKey.all
  end

  # GET /schema_keys/1
  # GET /schema_keys/1.json
  def show
  end

  # GET /schema_keys/new
  def new
    @schema_key = SchemaKey.new
  end

  # GET /schema_keys/1/edit
  def edit
  end

  # POST /schema_keys
  # POST /schema_keys.json
  def create
    @schema_key = SchemaKey.new(schema_key_params)

    respond_to do |format|
      if @schema_key.save
        format.html { redirect_to @schema_key, notice: 'Schema key was successfully created.' }
        format.json { render :show, status: :created, location: @schema_key }
      else
        format.html { render :new }
        format.json { render json: @schema_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schema_keys/1
  # PATCH/PUT /schema_keys/1.json
  def update
    respond_to do |format|
      if @schema_key.update(schema_key_params)
        format.html { redirect_to @schema_key, notice: 'Schema key was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema_key }
      else
        format.html { render :edit }
        format.json { render json: @schema_key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schema_keys/1
  # DELETE /schema_keys/1.json
  def destroy
    @schema_key.destroy
    respond_to do |format|
      format.html { redirect_to schema_keys_url, notice: 'Schema key was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema_key
      @schema_key = SchemaKey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_key_params
      params.require(:schema_key).permit(:schema_table_id, :name, :primary, :unique)
    end
end

class SchemaKeyFieldsController < ApplicationController
  before_action :set_schema_key_field, only: [:show, :edit, :update, :destroy]

  # GET /schema_key_fields
  # GET /schema_key_fields.json
  def index
    @schema_key_fields = SchemaKeyField.all
  end

  # GET /schema_key_fields/1
  # GET /schema_key_fields/1.json
  def show
  end

  # GET /schema_key_fields/new
  def new
    @schema_key_field = SchemaKeyField.new
  end

  # GET /schema_key_fields/1/edit
  def edit
  end

  # POST /schema_key_fields
  # POST /schema_key_fields.json
  def create
    @schema_key_field = SchemaKeyField.new(schema_key_field_params)

    respond_to do |format|
      if @schema_key_field.save
        format.html { redirect_to @schema_key_field, notice: 'Schema key field was successfully created.' }
        format.json { render :show, status: :created, location: @schema_key_field }
      else
        format.html { render :new }
        format.json { render json: @schema_key_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schema_key_fields/1
  # PATCH/PUT /schema_key_fields/1.json
  def update
    respond_to do |format|
      if @schema_key_field.update(schema_key_field_params)
        format.html { redirect_to @schema_key_field, notice: 'Schema key field was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema_key_field }
      else
        format.html { render :edit }
        format.json { render json: @schema_key_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schema_key_fields/1
  # DELETE /schema_key_fields/1.json
  def destroy
    @schema_key_field.destroy
    respond_to do |format|
      format.html { redirect_to schema_key_fields_url, notice: 'Schema key field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema_key_field
      @schema_key_field = SchemaKeyField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_key_field_params
      params.require(:schema_key_field).permit(:schema_key_id, :name, :order)
    end
end

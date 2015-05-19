class SchemaFieldsController < ApplicationController
  before_action :set_schema_field, only: [:show, :edit, :update, :destroy]

  # GET /schema_fields
  # GET /schema_fields.json
  def index
    @schema_fields = SchemaField.all
  end

  # GET /schema_fields/1
  # GET /schema_fields/1.json
  def show
  end

  # GET /schema_fields/new
  def new
    @schema_field = SchemaField.new
  end

  # GET /schema_fields/1/edit
  def edit
  end

  # POST /schema_fields
  # POST /schema_fields.json
  def create
    @schema_field = SchemaField.new(schema_field_params)

    respond_to do |format|
      if @schema_field.save
        format.html { redirect_to @schema_field, notice: 'Schema field was successfully created.' }
        format.json { render :show, status: :created, location: @schema_field }
      else
        format.html { render :new }
        format.json { render json: @schema_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schema_fields/1
  # PATCH/PUT /schema_fields/1.json
  def update
    respond_to do |format|
      if @schema_field.update(schema_field_params)
        format.html { redirect_to @schema_field, notice: 'Schema field was successfully updated.' }
        format.json { render :show, status: :ok, location: @schema_field }
      else
        format.html { render :edit }
        format.json { render json: @schema_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schema_fields/1
  # DELETE /schema_fields/1.json
  def destroy
    @schema_field.destroy
    respond_to do |format|
      format.html { redirect_to schema_fields_url, notice: 'Schema field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schema_field
      @schema_field = SchemaField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schema_field_params
      params.require(:schema_field).permit(:schema_table_id, :name, :field_type, :type_params, :nullable, :default)
    end
end

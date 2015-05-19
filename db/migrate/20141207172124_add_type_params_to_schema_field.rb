class AddTypeParamsToSchemaField < ActiveRecord::Migration
  def change
    add_column :schema_fields, :type_params, :string
  end
end

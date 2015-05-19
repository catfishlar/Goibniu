class AddFieldTypeToSchemaFields < ActiveRecord::Migration
  def change
    add_column :schema_fields, :field_type, :string
  end
end

class RemoveTypeFromSchemaField < ActiveRecord::Migration
  def change
    remove_column :schema_fields, :type
  end
end

class RemoveSizeFromSchemaFields < ActiveRecord::Migration
  def change
    remove_column :schema_fields, :size
  end
end

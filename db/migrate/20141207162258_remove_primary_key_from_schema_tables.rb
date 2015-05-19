class RemovePrimaryKeyFromSchemaTables < ActiveRecord::Migration
  def change
    remove_column :schema_tables, :primary_key, :string
  end
end

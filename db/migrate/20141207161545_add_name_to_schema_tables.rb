class AddNameToSchemaTables < ActiveRecord::Migration
  def change
    add_column :schema_tables, :name, :string
  end
end

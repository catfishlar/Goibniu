class CreateSchemaTables < ActiveRecord::Migration
  def change
    create_table :schema_tables do |t|
      t.integer :schema_version_id
      t.string :primary_key

      t.timestamps
    end
  end
end

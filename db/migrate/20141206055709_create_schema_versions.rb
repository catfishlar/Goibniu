class CreateSchemaVersions < ActiveRecord::Migration
  def change
    create_table :schema_versions do |t|
      t.integer :schema_id
      t.string :version
      t.string :mysql_dump
      t.string :mysql_distrib
      t.string :comment

      t.timestamps
    end
  end
end

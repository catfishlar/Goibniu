class CreateSchemaFields < ActiveRecord::Migration
  def change
    create_table :schema_fields do |t|
      t.integer :schema_table_id
      t.string :name
      t.string :type
      t.integer :size
      t.boolean :nullable
      t.string :default

      t.timestamps
    end
  end
end

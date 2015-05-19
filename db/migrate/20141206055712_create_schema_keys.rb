class CreateSchemaKeys < ActiveRecord::Migration
  def change
    create_table :schema_keys do |t|
      t.integer :schema_table_id
      t.string :name
      t.boolean :primary
      t.boolean :unique

      t.timestamps
    end
  end
end

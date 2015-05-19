class CreateSchemaKeyFields < ActiveRecord::Migration
  def change
    create_table :schema_key_fields do |t|
      t.integer :schema_key_id
      t.string :name
      t.integer :order

      t.timestamps
    end
  end
end

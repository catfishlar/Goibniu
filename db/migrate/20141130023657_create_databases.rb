class CreateDatabases < ActiveRecord::Migration
  def change
    create_table :databases do |t|
      t.string :name
      t.string :host
      t.string :dbschema

      t.timestamps
    end
  end
end

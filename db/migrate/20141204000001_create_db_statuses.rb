class CreateDbStatuses < ActiveRecord::Migration
  def change
    create_table :db_statuses do |t|
      t.integer :database_id
      t.date :request_date
      t.text :note

      t.timestamps
    end
  end
end

class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.string :name
      t.text :description
      t.boolean :published, default: false, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :deleted, default: false, null: false

      t.timestamps null: false
    end
  end
end

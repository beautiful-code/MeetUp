class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.references :group, index: true
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :created_at
      t.references :user, index: true

      t.timestamps
    end
  end
end

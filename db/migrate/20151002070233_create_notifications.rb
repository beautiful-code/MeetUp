class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notification_status
      t.string :notification_type
      t.integer :member_id
      t.references :event, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

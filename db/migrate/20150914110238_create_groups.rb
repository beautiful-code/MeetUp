class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.text :name
      t.references :user, index: true

      t.timestamps
    end
  end
end

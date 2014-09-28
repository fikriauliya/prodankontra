class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end

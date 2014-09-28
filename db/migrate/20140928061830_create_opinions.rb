class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.boolean :is_pro
      t.text :title
      t.integer :user_id
      t.text :source
      t.string :author
      t.integer :topic_id
      t.text :content

      t.timestamps
    end
  end
end

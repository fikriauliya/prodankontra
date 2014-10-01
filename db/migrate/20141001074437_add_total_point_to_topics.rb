class AddTotalPointToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :total_point, :integer, default: 0
  end
end

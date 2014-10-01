class AddCachedVotesToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :cached_votes_up, :integer, default: 0
    add_column :topics, :cached_votes_down, :integer, default: 0
    add_column :topics, :cached_votes_total, :integer, default: 0

    add_index  :topics, :cached_votes_up
    add_index  :topics, :cached_votes_down
    add_index  :topics, :cached_votes_total
  end
end

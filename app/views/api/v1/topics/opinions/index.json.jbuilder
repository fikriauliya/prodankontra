json.opinions(@opinions) do |opinion|
  json.extract! opinion, :is_pro, :id, :title, :source, :author, :content, :topic_id
  json.upvotes_count opinion.cached_votes_up
  json.downvotes_count opinion.cached_votes_down
end

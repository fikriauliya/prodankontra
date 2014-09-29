json.opinions(@opinions) do |opinion|
  json.extract! opinion, :is_pro, :id, :title, :source, :author, :content, :topic_id
  json.upvotes_count opinion.get_upvotes.count
  json.downvotes_count opinion.get_downvotes.count
end

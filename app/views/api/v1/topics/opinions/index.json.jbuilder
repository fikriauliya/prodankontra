json.opinions(@opinions) do |opinion|
  json.extract! opinion, :is_pro, :id, :title, :source, :author, :content
end

class Topic < ActiveRecord::Base
  belongs_to :user
  before_save :set_total_point
  acts_as_votable

  def set_total_point
    sign = if self.cached_votes_up >= self.cached_votes_down then 1 else -1 end
    normalized_vote_point = sign * Math.log2((self.cached_votes_up - self.cached_votes_down).abs + 1).to_i

    base = 1406818754 #31 July 2014
    if self.created_at
      time_point = (self.created_at.to_i - base) / 15000
    else
      time_point = (Time.now.to_i - base) / 15000
    end

    self.total_point = normalized_vote_point + time_point
  end
end

class Api::V1::Topics::OpinionsController < ApplicationController
  before_action :authenticate_user_json!, only: [:vote]

  def index
    if params[:is_pro] == "true" then is_pro = true else is_pro = false end
    @opinions = Opinion.where(topic_id: params[:topic_id], is_pro: is_pro)
  end

  def vote

  end
end

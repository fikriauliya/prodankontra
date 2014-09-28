class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
    @topic = Topic.find(params[:topic_id])
    @opinion.is_pro = if params[:is_pro] == "true" then true else false end
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @topic = Topic.find(params[:topic_id])
    @opinion = Opinion.new(opinion_params)
    @opinion.topic_id = params[:topic_id]
    @opinion.user_id = current_user.id

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to @topic, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opinion_params
    params.require(:opinion).permit(:title, :source, :author, :content, :is_pro)
  end
end

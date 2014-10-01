class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /opinions/1
  # GET /opinions/1.json
  def show
    @topic = Topic.find(@opinion.topic_id)
    gon.opinion_id = @opinion.id
    gon.topic_id = @opinion.topic_id
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
    @topic = Topic.find(params[:topic_id])
    @opinion.is_pro = if params[:is_pro] == "true" then true else false end
  end

  # GET /opinions/1/edit
  def edit
    unless current_user == @opinion.user
      redirect_to root_path, alert: "You are not allowed to do this action"
    end

    @topic = Topic.find(params[:topic_id])
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
    unless current_user == @opinion.user
      redirect_to root_path, alert: "You are not allowed to do this action"
    end

    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to [@topic, @opinion], notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    unless current_user == @opinion.user
      redirect_to root_path, alert: "You are not allowed to do this action"
    end

    @topic = Topic.find(params[:topic_id])
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic), notice: 'Opinion was successfully destroyed.' }
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

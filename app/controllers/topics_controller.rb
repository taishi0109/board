class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @new_Topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title))
    @topic.save
    redirect_to topics_index_path
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(topic_id: params[:id])
    @posts = Post.where(topic_id: params[:id])
  end
end

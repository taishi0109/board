class TopicsController < ApplicationController
  def index
    @topic = Topic.new
    @topics = Topic.all.search(params[:title])
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title))
    if @topic.save
      redirect_to topics_path
    else
      flash[:notice] = @topic.errors.full_messages.join('\n')
      redirect_to topics_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @newpost = Post.new(topic_id: params[:id])
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end

  def new
    @topic = Topic.new
  end

end

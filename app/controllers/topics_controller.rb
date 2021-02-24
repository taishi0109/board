class TopicsController < ApplicationController
  def index
    @topic = Topic.new
    @topics = Topic.all.search(params[:title])
  end

  def create
    @topic = Topic.new(
      title: params[:topic]["title"],
      user_id: temp_id
    )
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
    @posts = @posts.paginate(page: params[:page], per_page: 1000)
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.user_id != temp_id
      flash[:notice] = "削除する権限がありません"
      @topics = Topic.all
      render 'index'
      return
    end

    @topic.destroy
    redirect_to topics_path
  end

  def new
    @topic = Topic.new
  end

  private

  def temp_id
    session[:temp_id] ||= SecureRandom.alphanumeric(7)
  end
end

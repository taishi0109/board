module Topics
  class PostsController < ApplicationController
    def create
      topic = Topic.find(params[:topic_id])
      @post = topic.posts.new(
        name: post_params[:name],
        body: post_params[:body],
        user_id: temp_id
      )
      if @post.save
        redirect_to topic_path(@post.topic)
      else
        flash[:notice] = @post.errors.full_messages.join('\n')
        redirect_to topic_path(@post.topic)
      end
    end

    def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
    end

    def update
      @topic = Topic.find(params[:topic_id])
      @post = Post.find_by(id: params[:id])
      @post.body = params[:body]
      if @topic.user_id != temp_id
        flash[:notice] = "編集する権限がありません"
        @posts = @topic.posts
        render 'edit'
        return
      end
      if @post.save
        redirect_to topic_path(@topic)
      else
        render 'edit'
      end
    end

    private

    def post_params
      params[:post].permit(:topic_id, :name, :body)
    end

    def temp_id
      session[:temp_id] ||= SecureRandom.alphanumeric(7)
    end
  end
end

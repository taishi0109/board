module Topics
  class PostsController < ApplicationController
    def create
      @post = Post.new(params[:post].permit(:topic_id, :name, :body))
      @post.save
      redirect_to topic_path(params[:post]['topic_id'])
    end

    def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
    end

    def update
      @topic = Topic.find(params[:topic_id])
      @post = Post.find_by(id: params[:id])

      @post.body = params[:content]
      @post.save
      # redirect_to("/topics/#{params[:topic_id]}")
      # redirect_to("/topics/#{@post.topic.id}")
      # redirect_to topic_path(params[:topic_id])
      redirect_to topic_path(@topic)
    end
  end
end

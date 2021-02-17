module Topics
  class PostsController < ApplicationController
    def create
      @post = Post.new(post_params)
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
      @post.body = params[:content]
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
  end
end

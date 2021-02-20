module Topics
  module Posts
    class LikesController < ApplicationController
      def create
        @post = Post.find(params[:post_id])
        @alreadylike = @post.likes.find_by(ip: request.remote_ip)
        if @alreadylike
          redirect_back(fallback_location: root_path)
          flash[:notice] = "すでにいいねしています"
        else
          @like = Like.create(post_id: params[:post_id], ip: request.remote_ip)
          redirect_back(fallback_location: root_path)
        end
      end
    end
  end
end

class PostsController < ApplicationController

    def index 
        render json: Post.all.order(created_at: :desc)
    end

    def show 
        post = Post.find(params[:id])
        render json: post, serializer: EachPostSerializerSerializer, status: :ok
    end

    def create 
        post = Post.create(post_params)
        render json: post, status: :created
    end

    private 
    
    def post_params 
        params.permit(:title, :content, :user_id)
    end

end

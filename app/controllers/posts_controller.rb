class PostsController < ApplicationController

    skip_before_action :comfirm_authentication, only: [:index]

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

    def increment_likes 
        post = Post.find_by(id: params[:id])
        post.update(likes: post.likes + 1)
        render json: post
    end

    def destroy 
        post = Post.find_by(id: params[:id])
        if post 
           if post.user_id == current_user.id 
            post.destroy
            head :no_content
           else 
            render json: {error: "Only the post owner can perform this action"}, status: :unauthorized
           end
        else
            render json: {error: 'Noauthorized'}, status: :unprocessable_entity
        end
        # if current_user.id == params[:id] 
        #     byebug
        # else
        #     render json: {error: "You cannot delete this post!"}, status: :unprocessable_entity
        # end

    end
    private 
    
    def post_params 
        params.permit(:title, :content, :user_id, :likes)
    end

end

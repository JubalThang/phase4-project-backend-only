class CommentController < ApplicationController

    # post /comments 
    def create 
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: comment, status: :created 
        else 
            render json: {error: comment.error}, status: :unprocessable_entity
        end
    end

    private 
    def comment_params
        params.permit(:content, :post_id)
    end
end

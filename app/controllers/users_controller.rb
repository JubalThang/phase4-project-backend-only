class UsersController < ApplicationController
    # /profile or /me
    def show
        if current_user
            render json: current_user, status: :ok
        else 
            render json: {error: 'Please sign in'}, status: :unauthorized
        end
    end

    # /signup
    def create 
        user = User.create(user_params)
        if user.valid?
            session[:u_id] = user.id 
            render json: user, status: :created
        else 
            render json: {error: user.error}, status: :unprocessable_entity
        end 
    end

    private 
    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end

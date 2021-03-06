class SessionController < ApplicationController
    
    skip_before_action :comfirm_authentication, only: [:create]
    # /login
    def create 
        
        user = User.find_by_username(params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            current_user = user
            render json: user, status: :ok
        else 
            render json: {error: "Invalid credentials"}, status: :unauthorized
        end
    end

    # /logout
    def destroy 
        session.delete :user_id 
        head :no_content
    end
end

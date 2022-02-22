class SessionController < ApplicationController
    
    # /login
    def create 
        user = User.find_by_username(params[:username])
        if user&.authenticate(params[:password])
            session[:u_id] = user.id 
            render json: user, status: :ok
        else 
            render json: {error: "Invalid credentials"}, status: :unauthorized
        end
    end

end

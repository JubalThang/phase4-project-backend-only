class ApplicationController < ActionController::API
    include ActionController::Cookies 

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity 


    private 

    def current_user 
        User.find_by_id(session[:u_id])
    end

    def render_not_found(error)
        render json: {error: error}, status: :not_found
    end

    def handle_unprocessable_entity(valid)
        render json: {error: valid.record.errors}, status: :unprocessable_entity
    end

end

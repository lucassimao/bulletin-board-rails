class ApplicationController < ActionController::Base
    before_action :authorize, except: [:signout]

    def signout
        session[:current_user_id] = nil
        redirect_to :root
    end

    protected
    def authorize
        @current_user = Organization.find(3).admin
    end


end

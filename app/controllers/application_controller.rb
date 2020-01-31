class ApplicationController < ActionController::Base
    before_action :authorize, except: [:signout]

    def signout
        session[:current_user_id] = nil
        redirect_to :root
    end

    protected
    def authorize
        @current_user = Organization.find_by_name('Test organization').admin
    end


end

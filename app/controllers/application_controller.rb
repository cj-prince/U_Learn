class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    after_action :user_activity
   
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    include PublicActivity::StoreController

    private

    def user_activity
        current_user.try :touch
    end
    def user_not_authorized #pundit
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end

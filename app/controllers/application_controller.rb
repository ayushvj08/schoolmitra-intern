class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      return root_path
    end
    # if current_user
    #   request.referrer
    # else
    #   root_path
    # end
  end
end

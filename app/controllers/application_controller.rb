class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :exception
  rescue_from NoMethodError, with: :exception

  def exception
    redirect_to home_about_url, notice: "You do not have permission to perform this action"
  end

end

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index

  def show_certificate
    CreatePdfJob.set(wait: 10.seconds).perform_later(current_user)
  end

  def index
  end
end

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index

  def show_certificate
    send_data CreatePdfJob.set(wait: 10.seconds).perform_now(current_user), filename: "Certificate.pdf", disposition: "attachment"
  end

  def index
  end
end

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => :index

  def show_certificate
    respond_to do |format|
      format.html {
        render pdf: "Bonafide Certificate", template: "home/certificate.html.erb" # Excluding ".pdf" extension.
      }
      format.pdf do
        render pdf: "Bonafide Certificate", template: "home/certificate.html.erb" # Excluding ".pdf" extension.
      end
    end
  end

  def index
  end
end

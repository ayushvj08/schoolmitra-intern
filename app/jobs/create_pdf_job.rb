class CreatePdfJob < ApplicationJob
  sidekiq_options queue: :default, retry: false

  def perform(current_user)
    save_path = Rails.root.join("/", "certificate.pdf")
    return if File.exist?(save_path)

    pdf_contents =
      ApplicationController.render(
        pdf: "Bonafide Certificate", template: "home/certificate.html.erb", locals: { current_user: current_user },
      )

    # Simulate slow PDF generation
    sleep 10
    pdf_contents

    # ApplicationController.new(send pdf: pdf_contents, filename: "Certificate.pdf", disposition: "attachment")

    # This saves the PDF to disk, but could put in the DB,
    # upload with ActiveStorage, attach to email, etc...
    # File.open("/certificate.pdf", "wb") { |file| file << pdf_contents }
  end
end

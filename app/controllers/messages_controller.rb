class MessagesController < ApplicationController 
  skip_before_action :verify_authenticity_token

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    random_artifact = RandomArtifactHelper::ArtifactFetcher.get_artifact
    sms = @client.messages.create(
      from: Rails.application.credentials.twilio_number,
      to: from_number,
      body: "A random artifact --> "\
      "Accession Number: #{random_artifact["accession_number"]}, "\
      "Image URL: #{random_artifact["image_url_full"]}, "\
      "Description: #{random_artifact["description"]}"
    )
  end

  private

  def boot_twilio
    account_sid = Rails.application.credentials.twilio_sid
    auth_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
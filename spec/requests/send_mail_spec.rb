require "rails_helper"

RSpec.describe "SendMail", type: :request do
  it "sends an email" do
    VCR.use_cassette("send_mail", serialize_with: :json) do
      message = {
        "from" => "\"Neil H.\" <neil.hendren@gmail.com>",
        "subject" => "Subject Here",
        "text" => "Content Here\r\n"
      }

      post(
        "/api/v0/advice",
        params: message.to_json,
        headers: {
          Accept: "application/json",
          "Content-Type" => "application/json"
        }
      )
    end
  end
end

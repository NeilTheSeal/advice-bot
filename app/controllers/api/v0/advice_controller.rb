require "json"

class Api::V0::AdviceController < ApplicationController
  def index
    email_info = JSON.parse(request.body.read, symbolize_names: true)

    from = email_info[:from][/[^<]*@[^>]*/, 0]
    subject = email_info[:subject]
    content = email_info[:text]

    incoming_email = IncomingEmail.create!(
      from:,
      subject:,
      content:
    )

    outgoing_email = incoming_email.create_outgoing_email!(
      email: from,
      subject: "example message",
      content: "example content"
    )

    AdviceMailer.send_advice(outgoing_email).deliver_now

    render json: { message: "Email sent" }, status: 200
  end
end

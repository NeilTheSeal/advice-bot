class Api::V0::AdviceController < ApplicationController
  def index
    from = params[:from][/[^<]*@[^>]*/, 0]
    subject = params[:subject]
    content = params[:text]

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

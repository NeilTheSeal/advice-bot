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

    content = create_advice(incoming_email)

    outgoing_email = incoming_email.create_outgoing_email!(
      email: from,
      subject: "My response to your advice request",
      content:
    )

    AdviceMailer.send_advice(outgoing_email).deliver_now

    render json: { message: "Email sent" }, status: 200
  end

  private

  def create_advice(email)
    content = email.content
    subject = email.subject

    message = "I am an email service that generates advice based " \
              "on the content of an email. A user sent me an email " \
              "with the subject of #{subject}. The content of the email " \
              "is: \r#{content}\rPlease generate advice based on this content."

    OpenaiService.new(message).generate_advice
  end
end

class AdviceMailer < ApplicationMailer
  def send_advice(advice)
    @advice = advice
    mail(
      to: @advice.email,
      subject: @advice.subject,
      from: "advice@neilhendren.com",
      reply_to: "no-reply@neilhendren.com",
      content_type: "text/html"
    )
  end
end

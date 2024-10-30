class ApplicationMailbox < ActionMailbox::Base
  routing all: :receiver
end

class ReceiverMailbox < ApplicationMailbox
  def process
    p mail
  end
end

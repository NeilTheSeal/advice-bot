require "json"

class Api::V0::AdviceController < ApplicationController
  def index
    email_info = JSON.parse(request.body.read, symbolize_names: true)
    message = email_info[:text]
    subject = email_info[:subject]
    from = email_info[:from][/[^<]*@[^>]*/, 0]
    p from
  end
end

class AdviceController < ApplicationController
  def index
    p params[:text]
  end
end

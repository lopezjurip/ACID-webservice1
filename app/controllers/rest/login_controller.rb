# Handmade controller
class Rest::LoginController < ApplicationController
  def index
    # renders by default: '/app/views/rest/login/index.html.erb'
  end

  def create
    render json: login_params
  end

  private

  def login_params
    params.permit(:email, :image)
  end
end

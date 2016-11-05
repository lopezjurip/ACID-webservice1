require_relative '../../../lib/webservice2'

SERVICE_URI = ENV['SERVICE_URI'] || 'http://localhost:3000'

# Handmade controller
class Rest::LoginController < ApplicationController
  # Ensure WebService2 communicator object is instantiated
  before_filter :set_webservice2

  def index
    # renders by default: '/app/views/rest/login/index.html.erb'
  end

  def create
    email, image = login_params.values_at(:email, :image)
    user_agent = request.user_agent

    # Call webservice and get status code
    case @webservice2.validate(email, image).code
    when 200
      LoginNotifierMailer.send_result(email, 'OK', user_agent).deliver_later
      render json: { message: 'OK' }, status: 200
    when 401
      LoginNotifierMailer.send_result(email, 'No Autorizado', user_agent).deliver_later
      render json: { message: 'No Autorizado' }, status: 401
    when 402...500
      render json: { message: 'Mala solicitud' }, status: 400
    when 500...600
      render json: { message: 'Server error :(' }, status: 500
    end
  end

  private

  def login_params
    params.permit(:email, :image)
  end

  def set_webservice2
    @webservice2 ||= WebService2.new(SERVICE_URI)
  end
end

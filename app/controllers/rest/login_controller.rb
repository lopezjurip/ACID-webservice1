require 'httparty'

# Private service constants
JSON_HEADERS = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}.freeze

SERVICE_URI = ENV['SERVICE_URI'] || 'http://localhost:3000'

# Handmade controller
class Rest::LoginController < ApplicationController
  def index
    # renders by default: '/app/views/rest/login/index.html.erb'
  end

  def create
    # Prepare request
    endpoint = "#{SERVICE_URI}/rest/verify_user/#{login_params[:email]}"
    body = { image: login_params[:image] }.to_json

    # Call service
    response = HTTParty.post(endpoint, body: body, headers: JSON_HEADERS)

    case response.code
    when 200
      render json: { message: 'OK' }, status: 200
    when 401
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
end

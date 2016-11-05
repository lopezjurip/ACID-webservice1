require 'httparty'

JSON_HEADERS = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}.freeze

class WebService2
  def initialize(uri)
    @service_uri = uri
  end

  def validate(email, image)
    # Prepare request
    endpoint = URI.join(@service_uri, 'rest/', 'verify_user/', email).to_s
    body = { image: image }.to_json

    # Call service
    HTTParty.post(endpoint, body: body, headers: JSON_HEADERS)
  end
end

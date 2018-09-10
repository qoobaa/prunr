class FetchTree
  include Singleton

  API_URI = "https://kf6xwyykee.execute-api.us-east-1.amazonaws.com/production/tree/%{name}"
  MAX_RETRIES = 5

  ApiError = Class.new(StandardError)

  class << self
    delegate :call, to: :instance
  end

  def call(name)
    retries_count ||= MAX_RETRIES
    uri = URI(API_URI % {name: name})
    response = Net::HTTP.get_response(uri)
    raise ApiError, "API failed to respond too many times subsequently" if response.is_a?(Net::HTTPServerError)
    JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  rescue ApiError
    retries_count -= 1
    retry if retries_count >= 0
    raise
  end
end

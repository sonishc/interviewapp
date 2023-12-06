
require 'httparty'

module Hostway
  class AuthService
    def call
      endpoint = "#{ENV['HOSTWAY_API_URL']}/accessTokens"

      request_params = {
        body: {
          grant_type: 'client_credentials',
          client_id: ENV['HOSTWAY_CLIENT_ID'],
          client_secret: ENV['HOSTWAY_CLIENT_SECRET'],
          scope: 'general'
        }
      }

      response = HTTParty.post(endpoint, request_params)

      if response.success?
        access_token = response.parsed_response['access_token']
      else
        nil
      end
    end
  end
end

require 'httparty'

module Hostway
  class ReservationsService
    include HTTParty

    def fetch_reserwations(limit: 10, offset: 0, options: {})
      uri = URI(api_url)
      uri.query = URI.encode_www_form(options.merge(limit: limit, offset: offset))
      response = HTTParty.get(uri.to_s, headers: headers)
      if response.success?
        reservations = reservations_mapper(response.body)
        update_or_create_reservations(reservations) if reservations.present?
      else
        nil
      end
    rescue StandardError => e
      Rails.logger.error("Reservation API request failed: #{e.message}")
      nil
    end

    private

    def api_url
      "#{ENV['HOSTWAY_API_URL']}/reservations"
    end

    def headers
      {
        'Authorization' => "Bearer #{token}",
        'Cache-control' => 'no-cache'
      }
    end

    def update_or_create_reservations(reservations)
      reservations.each do |reservation|
        unless reservation.save
          Rails.logger.error("Unable to save reservation: #{reservation.source_id}")
        end
      end
    end

    def reservations_mapper(response_body)
      ReservationsMapperService.map_response_to_model(response_body)
    end

    def token
      AuthService.new.call
    end
  end
end

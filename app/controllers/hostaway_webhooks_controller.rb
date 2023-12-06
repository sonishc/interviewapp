class HostawayWebhooksController < ApplicationController
  protect_from_forgery with: :null_session

  def receive_hostaway_event
    payload = JSON.parse(request.body.read)

    if payload['status'] == 'success'
      reservation = Hostway::ReservationsMapperService.map(payload['result'])

      unless reservation.save
        Rails.logger.error("Unable to save reservation: #{reservation.source_id}")
      end
    end

    head :ok
  rescue JSON::ParserError => e
    render json: { error: 'Invalid JSON payload' }, status: :bad_request
  end
end

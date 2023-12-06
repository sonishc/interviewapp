module Hostway
  class ReservationsMapperService
    def self.map_response_to_model(response_body)
      response_data = JSON.parse(response_body)

      if response_data['status'] == 'success'
        mapped_objects = response_data['result'].map do |item|
          ReservationsMapperService.map_single_item_to_model(item)
        end

        mapped_objects
      else
        nil
      end
    end

    def self.map_single_item_to_model(item)
      reservation = Reservation.find_or_initialize_by(source: "Hostway", source_id: item['id'].to_s)
      reservation.check_in = item['checkInTime'].present? && DateTime.strptime(item['checkInTime'].to_s, '%H')
      reservation.check_in = item['checkOutTime'].present? && DateTime.strptime(item['checkOutTime'].to_s, '%H')
      reservation.price = item['totalPrice'].to_i
      reservation.guest_name = item['guestName']
      reservation.listing_id = item['listingMapId']
      reservation.status = item['status']
      reservation
    end
  end
end

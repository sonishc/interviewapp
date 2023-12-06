class ReservationsWorker
  include Sidekiq::Worker

  def perform
    ActiveRecord::Base.establish_connection
    # This job should fetch the latest reservations from the past 2 weeks from Hostaway
    # and update the reservations table.
    # Currently it fecthes un update by arrivalDateDesc

    Hostway::ReservationsService.new.fetch_reserwations(
      limit: 20,
      options: {
        sortOrder: 'arrivalDateDesc'
      }
    )
  end
end

every 1.day, at: '1:00 am' do
  runner 'ReservationsWorker.perform_async'
end

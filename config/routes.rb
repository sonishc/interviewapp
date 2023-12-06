Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post '/webhooks/receive_hostaway_event', to: 'hostaway_webhooks#receive_hostaway_event'
end

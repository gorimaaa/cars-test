Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "reservations/error_page"
  get "dashboard/send_reminder"
  get "dashboard/index"
  post 'dashboard/confirmation_mail/:reservation_id', to: 'dashboard#send_confirmation_admin', as: 'send_confirmation'
  post 'dashboard/reminder_mail/:reservation_id', to: 'dashboard#send_reminder_admin', as: 'send_reminder_admin'
  get "reservations/user_reservations"
  get "reservations/finalize_reservation"
  get "reservations/pay_confirmation"
  post 'reservations/reserve/:id', to: 'reservations#reserve_location', as: 'reserve_location'
  post 'reservations/cancel/:id', to: 'reservations#cancel_reservation', as: 'cancel_reservation'
  get 'reservations/finalize_reservation/:id_book', to: 'reservations#finalize_reservation', as: 'finalize_reservation'
  post 'reservations/pay_reservation', to: 'reservations#pay_reservation', as: 'pay_reservation'





  root "dashboard#index"
end

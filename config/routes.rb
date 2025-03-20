Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard/send_reminder"
  get "dashboard/index"
  get "reservations/user_reservations"
  get "reservations/pay_reservation"
  get "reservations/pay_confirmation"
  get 'reservations/pay_reservation/:id_book', to: 'reservations#pay_reservation', as: 'pay_reservation'
  post 'reservations/user_payed_book', to: 'reservations#user_payed_book', as: 'user_payed_book'
  post 'reservations/:id/book', to: 'reservations#book', as: 'book_reservation'
  post 'reservations/:id/cancel_book', to: 'reservations#cancel_book', as: 'cancel_book_reservation'
  post 'dashboard/confirmation_mail/:reservation_id', to: 'dashboard#send_confirmation_admin', as: 'send_confirmation'
  post 'dashboard/reminder_mail/:reservation_id', to: 'dashboard#send_reminder_admin', as: 'send_reminder_admin'


  root "dashboard#index"
end

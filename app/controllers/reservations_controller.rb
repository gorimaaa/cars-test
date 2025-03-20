class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.all
    end

    def user_reservations
        @reservations = Reservation.all

    end

    before_action :authenticate_user!
    def book
      @reservation = Reservation.find(params[:id]) # Trouve la réservation par son ID
      if @reservation.update(is_booked: true, user_id_book: current_user.id) # Met à jour la réservation
        ApplicationMailer.send_reminder(@reservation, current_user).deliver
        redirect_to dashboard_index_path, notice: "Réservation confirmée, un mail vous a été envoyé pour procéder au paiement."
      else
        redirect_to dashboard_index_path, alert: "Erreur lors de la réservation."
      end
    end

    before_action :authenticate_user!
    def cancel_book
        @reservation = Reservation.find(params[:id]) 
        if @reservation.update(is_booked: false, user_id_book: nil)
          redirect_to reservations_user_reservations_path, notice: "La réseveration a bien été annulé."
        else
          redirect_to reservations_user_reservations_path, alert: "Erreur lors de l'annulation."
        end
    end

    before_action :authenticate_user!
    def pay_reservation
      @id_book = params[:id_book] 
      @reservation = Reservation.find(@id_book) 
      if @reservation.is_booked && @reservation.user_id_book == current_user.id
        render reservations_pay_reservation_path, notice: "Succès"
      else
        render reservations_pay_reservation_path, notice: "Echec dans la réservation"

      end
    end

    def user_payed_book
      location = params[:location]
      insurance = params[:insurance]
      reservation_id = params[:reservation_id]
      reservation = Reservation.find(reservation_id)

      base_price = reservation.price * (reservation.end_date - reservation.start_date).to_i
      location_price = case location
                       when "paris" then 10
                       when "rouen" then 50
                       when "marseille" then 100
                       else 0
                       end
  
      insurance_price = case insurance
                        when "basic" then 20
                        when "premium" then 100
                        else 0
                        end
  
      total_price = base_price + location_price + insurance_price
  
      reservation.update(is_payed: true, delivery_location: location, insurance: insurance, price_payed: total_price)
  
      redirect_to reservations_pay_confirmation_path, notice: "Réservation confirmée avec un prix total de #{total_price}€, un mail de confirmation vous
      sera envoyé prochainement"
    end


end

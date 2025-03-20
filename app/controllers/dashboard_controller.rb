class DashboardController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def send_confirmation_admin
    reservation_id = params[:reservation_id]
    reservation = Reservation.find(reservation_id)
    user = User.find((reservation.user_id_book).to_i) 
    ApplicationMailer.send_confirmation(reservation, user).deliver
    redirect_to dashboard_index_path, notice: "La confirmation a été envoyé."
  end

  def send_reminder_admin
    reservation_id = params[:reservation_id]
    reservation = Reservation.find(reservation_id)
    user = User.find((reservation.user_id_book).to_i) 
    ApplicationMailer.send_reminder_admin(reservation, user).deliver
    redirect_to dashboard_index_path, notice: "Le rappel a été envoyé."
  end

  
end

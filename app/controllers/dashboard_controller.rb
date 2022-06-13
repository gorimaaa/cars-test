class DashboardController < ApplicationController
  def index

  end
  def send_reminder

    booking = Booking.new(
      starts_on: DateTime.new(2022, 6, 9)
    )
    ApplicationMailer.send_reminder(booking).deliver

    redirect_to dashboard_index_path
  end
end

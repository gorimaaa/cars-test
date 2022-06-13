class Booking
  include ActiveModel::AttributeMethods

  def initialize(**data)
    @starts_on = data[:starts_on]
  end
end
require 'elevator'

class FreightElevator < Elevator
  private

  def validate_floor(floor, weight, key=false)
    super && validate_weight(weight)
  end

  def validate_weight(kilograms=0)
    exceeded = kilograms > 3000
    puts 'ALERT: The weight limit has been exceeded. The elevator has shutdown.' if exceeded
    !exceeded
  end
end
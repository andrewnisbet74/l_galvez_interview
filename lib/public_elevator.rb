require 'elevator'

class PublicElevator < Elevator
  private

  def validate_floor(floor, weight, key=false)
    super &&
    can_access?(floor, key) &&
    validate_weight(weight)
  end

  def can_access?(floor, key)
    access = (needs_key?(floor) && key || !needs_key?(floor))
    puts "You can't access this floor without a key." unless access
    access
  end

  def needs_key?(floor)
    floor == stories.last || floor == basement.first
  end

  def validate_weight(kilograms=0)
    exceeded = kilograms > 1000
    puts 'ALERT: The weight limit has been exceeded. The elevator has shutdown.' if exceeded
    !exceeded
  end
end
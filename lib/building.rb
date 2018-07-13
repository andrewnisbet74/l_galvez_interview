require 'elevator'
require 'public_elevator'
require 'freight_elevator'

class Building
  STORIES = (1..50).to_a
  BASEMENT = [-1]

  attr_reader :public_elevator, :freight_elevator

  def initialize
    @public_elevator = PublicElevator.new(STORIES, BASEMENT)
    @freight_elevator = FreightElevator.new(STORIES, BASEMENT)
  end
end
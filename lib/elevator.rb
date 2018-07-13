class Elevator
  attr_reader :floor, :stories, :basement

  def initialize(stories, basement)
    @stories = stories
    @basement = basement
    @floor = 1
  end

  def select_floor(floor, weight=1, key=false)
    if validate_floor(floor, weight, key)
      @floor = floor
      puts "You have moved to floor ##{floor}."
      true
    else
      false
    end
  end

  private

  def floors
    stories + basement
  end

  def position
    floors[floor + 1]
  end

  def validate_floor(floor, weight, key=false)
    validate_floor_range(floor)
  end

  def validate_floor_range(floor)
    valid = !(floor > stories.last || floor < basement.first)
    puts "Floor #{floor} is not available." unless valid
    valid
  end
end
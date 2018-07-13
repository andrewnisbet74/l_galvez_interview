require 'spec_helper'

RSpec.describe Elevator do
  let(:stories) { (1..10).to_a }
  let(:basement) { [-1] }
  let(:elevator) { Elevator.new(stories, basement) }

  it 'initializes the elevator in floor 1' do
    expect(elevator.floor).to eq(1)
  end

  describe '#select_floor' do

    it 'moves to a valid floor, 2' do
      expect(elevator.select_floor(2)).to eq(true)
      expect(elevator.floor).to eq(2)
    end

    it 'moves to a valid basement, -1' do
      expect(elevator.select_floor(-1)).to eq(true)
      expect(elevator.floor).to eq(-1)
    end

    it 'doesn not move to an invalid floor, 100' do
      expect(elevator.select_floor(100)).to eq(false)
      expect(elevator.floor).not_to eq(100)
    end

    it 'doesn not move to an invalid basement, -100' do
      expect(elevator.select_floor(-100)).to eq(false)
      expect(elevator.floor).not_to eq(-100)
    end
  end
end
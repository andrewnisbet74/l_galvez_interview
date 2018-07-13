require 'spec_helper'

RSpec.describe PublicElevator do
  let(:stories) { (1..10).to_a }
  let(:basement) { [-1] }
  let(:elevator) { PublicElevator.new(stories, basement) }

  it 'initializes the elevator in floor 1' do
    expect(elevator.floor).to eq(1)
  end

  describe '#select_floor' do
    describe 'when weight is less than 1ton and no key' do
      describe 'when no key is available' do
        it 'moves to a valid floor, 2, with a weight of 100kg' do
          expect(elevator.select_floor(2, 100)).to eq(true)
          expect(elevator.floor).to eq(2)
        end

        it 'moves to a valid basement, -1, with a weight of 100kg' do
          expect(elevator.select_floor(basement.first, 100)).to eq(false)
          expect(elevator.floor).not_to eq(basement.first)
        end

        it 'doesn not move to an invalid floor, 100, with a weight of 100kg' do
          expect(elevator.select_floor(100, 100)).to eq(false)
          expect(elevator.floor).not_to eq(100)
        end

        it 'doesn not move to an invalid basement, -100, with a weight of 100kg' do
          expect(elevator.select_floor(-100, 100)).to eq(false)
          expect(elevator.floor).not_to eq(-100)
        end
      end

      describe 'when key is available' do
        it 'moves to a valid floor, 2, with a weight of 100kg' do
          expect(elevator.select_floor(2, 100, true)).to eq(true)
          expect(elevator.floor).to eq(2)
        end

        it 'moves to a valid basement, -1, with a weight of 100kg' do
          expect(elevator.select_floor(basement.first, 100, true)).to eq(true)
          expect(elevator.floor).to eq(basement.first)
        end

        it 'doesn not move to an invalid floor, 100, with a weight of 100kg' do
          expect(elevator.select_floor(100, 100)).to eq(false)
          expect(elevator.floor).not_to eq(100)
        end

        it 'doesn not move to an invalid basement, -100, with a weight of 100kg' do
          expect(elevator.select_floor(-100, 100)).to eq(false)
          expect(elevator.floor).not_to eq(-100)
        end
      end
    end

    describe 'when weight is more than 1ton and no key' do
      describe 'when no key is available' do
        it 'moves to a valid floor, 2, with a weight of 100kg' do
          expect(elevator.select_floor(2, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(2)
        end

        it 'moves to a valid basement, -1, with a weight of 100kg' do
          expect(elevator.select_floor(basement.first, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(basement.first)
        end

        it 'doesn not move to an invalid floor, 100, with a weight of 100kg' do
          expect(elevator.select_floor(100, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(100)
        end

        it 'doesn not move to an invalid basement, -100, with a weight of 100kg' do
          expect(elevator.select_floor(-100, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(-100)
        end
      end

      describe 'when key is available' do
        it 'moves to a valid floor, 2, with a weight of 100kg' do
          expect(elevator.select_floor(2, 1001, true)).to eq(false)
          expect(elevator.floor).not_to eq(2)
        end

        it 'moves to a valid basement, -1, with a weight of 100kg' do
          expect(elevator.select_floor(basement.first, 1001, true)).to eq(false)
          expect(elevator.floor).not_to eq(basement.first)
        end

        it 'doesn not move to an invalid floor, 100, with a weight of 100kg' do
          expect(elevator.select_floor(100, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(100)
        end

        it 'doesn not move to an invalid basement, -100, with a weight of 100kg' do
          expect(elevator.select_floor(-100, 1001)).to eq(false)
          expect(elevator.floor).not_to eq(-100)
        end
      end
    end

  end
end
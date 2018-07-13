require 'spec_helper'

RSpec.describe Building do
  let(:building) { Building.new }

  it 'has a freight elevator' do
    expect(building.freight_elevator).to be_an_instance_of(FreightElevator)
  end

  it 'has a public elevator' do
    expect(building.freight_elevator).to be_an_instance_of(FreightElevator)
  end
end
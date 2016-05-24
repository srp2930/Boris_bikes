require './lib/bike.rb'

describe Bike do
  
  before(:each) do
      @bike = Bike.new
  end

  it 'responds to #new' do
    expect(Bike).to respond_to(:new)
  end

  it 'responds to #working?' do
    expect(@bike).to respond_to(:working?)
  end

end

require './lib/dock.rb'

describe 'Dock' do 

  before(:each) do
    @dock = Dock.new
  end

  it 'is not nil' do
    expect(@dock).not_to be nil
  end

end

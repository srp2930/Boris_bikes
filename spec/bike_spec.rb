require 'bike'

describe Bike do

  it { should be_instance_of(Bike)}

  it {is_expected.to respond_to(:working?)}

  it 'is a working bike' do
    expect(subject.working?).to eq(true)
  end

end

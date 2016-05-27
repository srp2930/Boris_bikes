#describe the bike class

require 'bike'

describe Bike do
	it "checks if bike is working" do
		expect(subject).to respond_to :working?
	end

describe 'broken bike' do
  it 'is not working' do
		subject.report_broken
    expect(subject).to be_broken
  end
end
end

require 'rails_helper'

RSpec.describe Operator, :type => :model do
  describe '#inquires' do
    let(:inquire) {FactoryGirl.build :inquire}
    let(:client)  {FactoryGirl.create :client}
    let(:operator_with_inquire) do
      o = FactoryGirl.create :operator, client: client
      inquire.operator = o
      client.inquires << inquire
      client.save!
      inquire.save!
      o
    end

    it 'return inquires associated with operator' do
      expect(operator_with_inquire.inquires).to eq([inquire])
    end
  end
end

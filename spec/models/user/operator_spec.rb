require 'rails_helper'

RSpec.describe User::Operator, :type => :model do
  describe '#inquires' do
    let(:inquire) {FactoryGirl.build :inquire}
    let(:clients)  {FactoryGirl.create :clients}
    let(:operator_with_inquire) do
      o = FactoryGirl.create :operator, clients: client
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

RSpec.shared_context 'signed in as client' do
  let(:client) {FactoryGirl.create :client}
  before(:each) {sign_in client}
end

RSpec.shared_context 'signed in as operator' do
  let(:operator) {FactoryGirl.create :operator}
  before(:each) {sign_in operator}
end
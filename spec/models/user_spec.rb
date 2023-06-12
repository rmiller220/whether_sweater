require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
  end

  it "instance methods" do
    user = User.new.generate_api_key

    expect(user.api_key).to_not be(nil)
    expect(user.api_key).to be_a(String)
    expect(user.api_key.length).to eq(32)
  end
end
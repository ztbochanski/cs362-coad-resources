require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { build_stubbed(:user)}
  
  describe "attributes" do 
    it "exist" do
      expect(user).to respond_to(:email)
    end
  end
  
  describe "#to_s" do
    it "returns the email" do
      email = 'fake@email.com'
      user = User.new(email: email)
      expect(user.to_s).to eq(email)
    end
  end
  
  describe "validations" do 
    it "cannot have a blank email" do
      user = User.new(email: nil)
      expect(user).to be_invalid
    end
  end

end

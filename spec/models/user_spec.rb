require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { build_stubbed(:user)
  }
  
  describe "attributes" do 
    it "exist" do
      expect(user).to respond_to(:email)
    end
  end
  
  describe "#to_s" do
    it "returns the name" do
      name = 'Joe Mama'
      user = User.new(name: name)
      expect(user.to_s).to eq(name)
    end
  end
  
  describe "::unspecified" do
    it "returns a user with the name 'Unspecified" do
      user = User.unspecified
      expect(user.name).to eq('Unspecified')
    end
  end
  
  describe "association" do
    it "has many tickets" do
      expect(User.new).to have_many(:tickets)
    end
  end 
       
  describe "validations" do 
    it "cannot have a blank email" do
      user = User.new(email: nil)
      expect(user).to be_invalid
    end

end

require 'rails_helper'

RSpec.describe User, type: :model do
  let :user {
    User.new(email: 'reynollu@oregonstate.edu')
      role:"bruh"
  }
  
  it "exists" do
  	User.new
  end
  
  describe "attributes" do 
    it "has an email" do
      user = User.new
      expect(user).to respond_to(:email)
    end
  end
  
  describe "#to_s" do
    it "returns the name" do
      name = 'Mt.Hood'
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
      user = User.new(email: 'Fake User')
      expect(user).to be_valid
    end

    it "email must be unique" do
      user = User.new(email: 'Fake User')
    end

    it "email must have at least 1 character" do
      user = User.new(email: '')
      expect(user).to be_valid
    end

    it "email must match format" do
      user = User.new(email: '')
      expect(user).to be_valid
    end

    it "email cannot exceed 255 characters" do
      user = User.new(email: '')
      expect(user).to be_valid
    end

    it "password must have at least 7 characters" do
      user = User.new(password: '')
      expect(user).to be_valid
    end

    it "password cannot exceed 255 characters" do
      user = User.new(password: '')
      expect(user).to be_valid
    end


  end
end

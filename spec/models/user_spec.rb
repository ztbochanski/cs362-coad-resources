require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { build_stubbed(:user)}
  
  describe "attributes" do 
    it "has an email" do
      expect(user).to respond_to(:email)
    end
    it "has a role" do
      expect(user).to respond_to(:role)
    end
  end
  describe "associations" do
    it "belongs to an organization" do
      expect(user).to belong_to(:organization)
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
    it "has a password" do
      expect(user).to validate_presence_of(:password).on(:create)
    end  
  end
  
  describe "#set_default_role" do
    it "sets status to organization by default" do
      user.role = nil
      expect(user.role).to be_nil
      user.set_default_role
      expect(user.role).to eq("organization")
      user.role = "admin"
      user.set_default_role
      expect(user.role).to_not eq("organization")
    end
  end


end

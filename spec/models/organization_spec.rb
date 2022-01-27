require 'rails_helper'

RSpec.describe Organization, type: :model do

  describe "validations" do

    it "is not valid without and email" do
      organization = Organization.new(email: "fake@fake.com")
      expect(organization).to be_invalid
    end

    it "is not valid without a name" do
      organization = Organization.new(name: "fakename")
      expect(organization).to be_invalid
    end

  end

end

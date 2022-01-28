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

    it "is not valid without a phone" do
      organization = Organization.new(phone: "fakephone")
      expect(organization).to be_invalid
    end

    it "is not valid without a status" do
      organization = Organization.new(status: :approved)
      expect(organization).to be_invalid
    end

    it "is not valid without a primary name" do
      organization = Organization.new(primary_name: "fake primary name")
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary name" do
      organization = Organization.new(secondary_name: "fake secondary name")
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary phone" do
      organization = Organization.new(secondary_phone: "fake secondary phone")
      expect(organization).to be_invalid
    end

    it "is not valid without a title" do
      organization = Organization.new(title: "fake title")
      expect(organization).to be_invalid
    end

    it "is not valid without a description" do
      organization = Organization.new(description: "fake description")
      expect(organization).to be_invalid
    end

    it "is not valid without transportation" do
      organization = Organization.new(transportation: :yes)
      expect(organization).to be_invalid
    end

  end

end

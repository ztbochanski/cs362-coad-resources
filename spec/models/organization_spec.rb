require 'rails_helper'

RSpec.describe Organization, type: :model do

  let (:organization) {
    build_stubbed(:organization)
  }

  describe "validations" do

    it "is not valid without an email" do
      expect(organization).to be_valid
      organization.email = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a name" do
      expect(organization).to be_valid
      organization.name = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a phone" do
      expect(organization).to be_valid
      organization.phone = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a status" do
      expect(organization).to be_valid
      organization.status = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a primary name" do
      expect(organization).to be_valid
      organization.primary_name = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary name" do
      expect(organization).to be_valid
      organization.secondary_name = nil
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary phone" do
      expect(organization).to be_valid
      organization.secondary_phone = nil
      expect(organization).to be_invalid
    end

  end

  describe "behaviors" do
    
    describe "#approve" do
      it "is approved" do
        expect(organization).not_to eq(:approved)
        expect(organization.approve).to eq(:approved)
      end
    end

    describe "#reject" do
      it "is rejected" do
        expect(organization.status).not_to eq(:rejected)
        expect(organization.reject).to eq(:rejected)
      end
    end

    describe "#set_default_status" do
      it "has not status then its default is submitted" do
        organization.status = ""
        expect(organization.status).not_to eq(:submitted)
        expect(organization.set_default_status).to eq(:submitted)
      end
    end
    
    describe "#to_s" do
      it "is returns the name" do
        organization.name = "fake organization"
        expect(organization.to_s).to eq(organization.name)
      end
    end

  end

  describe "association" do
    it "has many tickets" do
      expect(organization).to have_many(:tickets)
    end

    it "has many users" do
      expect(organization).to have_many(:users)
    end
  end 

end

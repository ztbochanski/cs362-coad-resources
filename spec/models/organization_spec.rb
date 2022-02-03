require 'rails_helper'

RSpec.describe Organization, type: :model do

  let (:organization){
    build_stubbed(:organization)
  }

  describe "validations" do

    it "is not valid without an email" do
      organization = build(:organization, email: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a name" do
      organization = build(:organization, name: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a phone" do
      organization = build(:organization, phone: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a status" do
      organization = build(:organization, status: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a primary name" do
      organization = build(:organization, primary_name: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary name" do
      organization = build(:organization, secondary_name: nil)
      expect(organization).to be_invalid
    end

    it "is not valid without a secondary phone" do
      organization = build(:organization, secondary_phone: nil)
      expect(organization).to be_invalid
    end

  end

  describe "behaviors" do
    
    describe "#approve" do
      it "is approved" do
        expect(organization.approve).to eq(:approved)
      end
    end

    describe "#reject" do
      it "is approved" do
        expect(organization.reject).to eq(:rejected)
      end
    end

    describe "#set_default_status" do
      it "has not status then its default is submitted" do
        status = ""
        organization = build(:organization, status: status)
        expect(organization.set_default_status).to eq(:submitted)
      end
    end
    
    describe "#to_s" do
      it "is returns the name" do
        name = "fake organization"
        organization = build(:organization, name: name)
        expect(organization.to_s).to eq(name)
      end
    end

  end 

end

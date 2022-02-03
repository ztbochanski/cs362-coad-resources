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

end

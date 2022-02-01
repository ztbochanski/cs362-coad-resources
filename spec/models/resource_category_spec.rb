require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
    let(:resource) { ResourceCategory.new(name: 'Fake resource category')}

    it "exists" do
        ResourceCategory.new
    end

    describe "attributes" do
      it "has a name" do
        resourcecategory = ResourceCategory.new
        expect(resourcecategory).to respond_to(:name)
      end
      
    end

    describe "scope" do
      it "has a scope" do
        resourcecategory = ResourceCategory.new
        expect(resourcecategory).to respond_to(:active || :inactive)

      end
    end
    describe "::unspecified" do
      it "returns a resource category with the name 'Unspecified" do
          resourcecategory = ResourceCategory.unspecified
          expect(resourcecategory.name).to eq('Unspecified')
      end
    end

    describe "#activate" do
      it "updates the scope to be active" do
        resourcecategory = ResourceCategory.new(active: false)
        resourcecategory.activate()
        expect(resourcecategory.active).to eq(true)
      end
    end

    describe "#deactivate" do
      it "updates the scope to be deactivated" do
        resourcecategory = ResourceCategory.new(active: true)
        resourcecategory.deactivate()
        expect(resourcecategory.active).to eq(false)
      end
    end

    describe "#to_s" do
      it "returns the name" do
        name = "etherium"
        resourcecategory = ResourceCategory.new(name: name)
        expect(resourcecategory.to_s).to eq(name)
      end
    end




    

end

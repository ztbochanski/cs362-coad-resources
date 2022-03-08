require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    describe "#full_title" do
      it "returns the instance variable" do
        assign(:page_title, 'Basic Title')
        expect(helper.full_title).to eq("Basic Title")
      end
    end
    describe "#full_title" do
      it "returns the default title" do
        expect(helper.full_title).to eq("Disaster Resource Network")
      end
    end
end

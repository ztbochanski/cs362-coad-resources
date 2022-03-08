require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    
    describe "#full_title" do
      it "returns the instance variable" do
        page_title = "Basic Title"
        base_title = "Disaster Resource Network"
        expect(helper.full_title(page_title)).to eq("#{page_title} | #{base_title}")
      end
    end
    describe "#full_title" do
      it "returns the default title" do
        base_title = "Disaster Resource Network"
        expect(helper.full_title).to eq(base_title)
      end
    end
end

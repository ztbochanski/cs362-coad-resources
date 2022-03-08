require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

    describe "creating a ticket" do
        before do
            create(:region)
            create(:resource_category)
        end

        scenario "non-logged in user creates a ticket successfully" do
            visit new_ticket_url
            fill_in "Full Name", with: "FAKE USER"
            fill_in "Phone Number", with: "8314211816"
            select 'fake region', from: 'Region'
            select 'Fake Resource category', from: 'Resource Category'
            fill_in "Description", with: "Fake Description"
            click_on "Send this help request"
            expect(page).to have_text "Ticket Submitted"

            
        end
    end
end

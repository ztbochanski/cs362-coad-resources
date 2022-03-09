require 'rails_helper'

RSpec.describe 'Releasing a ticket by an/a', type: :feature do
  
	let(:approved_organization) { create(:organization, status: :approved) }
  let(:user) { create(:user, role: "organization", organization: approved_organization) }

  describe "user who is part of an organization" do
    it "releases a ticket" do
      ticket = create(:ticket, organization: approved_organization)
      expect(user.role).to eq("organization")
      user.confirm
      log_in_as(user)
      expect(page.body).to have_text("Dashboard")
      click_on "Tickets"
			click_on ticket.name
			click_on "Release"
    end
  end

end

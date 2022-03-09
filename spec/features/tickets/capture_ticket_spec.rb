require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
  
  let(:approved_organization) { create(:organization, status: :approved) }
  let(:user) { create(:user, role: "organization", organization: approved_organization) }

  describe "user who is part of an approved organization" do
    it "captures a ticket" do
      ticket = create(:ticket)
      user.confirm
      log_in_as(user)
      expect(page.body).to have_text("Dashboard")
      click_on "Tickets"
			click_on ticket.name
			click_on "Capture"
      click_on "Tickets"
			click_on ticket.name
      expect(page.body).to have_text(approved_organization.name)
    end
  end

end

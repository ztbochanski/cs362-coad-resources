require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  
	let(:organization) { create(:organization) }

  describe "a user who is part of an organization" do
    it "releases a ticket" do
      organization.approve
      ticket = create(:ticket, organization: organization)
    end
  end

end

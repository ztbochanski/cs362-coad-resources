require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let (:region) { create(:region) }
    let (:resource_category) { create(:resource_category) }
    let (:organization) { create(:organization) }

    let (:open_ticket) { Ticket.create!(
        closed: false,
        phone: "1-555-666-2244",
        name: "fake open ticket",
        organization: nil,
        region: region,
        resource_category: resource_category,
    )}

    let (:closed_ticket) { Ticket.create!(
        closed: true,
        phone: "1-555-666-2244",
        name: "fake closed ticket",
        organization: nil,
        region: region,
        resource_category: resource_category,
    )}

    let (:open_ticket_with_organization) { Ticket.create!(
        closed: false,
        phone: "1-555-666-2244",
        name: "fake open ticket with organization",
        organization: organization,
        region: region,
        resource_category: resource_category,
    )}

    let (:closed_ticket_with_organization) { Ticket.create!(
        closed: true,
        phone: "1-555-666-2244",
        name: "fake open ticket with organization",
        organization: organization,
        region: region,
        resource_category: resource_category,
    )}

    describe "scopes" do
        
        it "returns open tickets from database" do
            results = Ticket.open
            expect(results).to include(open_ticket)
            expect(results).to_not include(closed_ticket)
        end

        it "returns closed tickets from database" do
            results = Ticket.closed
            expect(results).to include(closed_ticket)
            expect(results).to_not include(open_ticket)
        end

        it "returns open tickets that have an organization" do
            results = Ticket.all_organization
            expect(results).to include(open_ticket_with_organization)
            expect(results).to_not include(closed_ticket_with_organization)
        end

    end

end

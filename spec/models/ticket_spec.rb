require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let (:region) { create(:region) }
    let (:resource_category) { create(:resource_category) }
    let (:organization) { create(:organization) }
    let (:ticket) { build(:ticket) }

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

    describe "validations" do
        
        it "has a name" do
            expect(ticket).to validate_presence_of(:name)
            ticket.name = nil
            expect(ticket).to be_invalid
        end

        it "has a phone" do
            expect(ticket).to validate_presence_of(:phone)
            ticket.phone = nil
            expect(ticket).to be_invalid
        end

        it "has a region id" do
            expect(ticket).to validate_presence_of(:region_id)
            ticket.region_id = nil
            expect(ticket).to be_invalid
        end

    end

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

        it "returns open tickets for all organizations" do
            results = Ticket.all_organization
            expect(results).to include(open_ticket_with_organization)
            expect(results).to_not include(closed_ticket_with_organization)
        end

        it "returns open tickets of a specific organization" do
            results = Ticket.organization(organization)
            expect(results).to include(open_ticket_with_organization)
            expect(results).to_not include(closed_ticket_with_organization)
        end

        it "returns closed tickets of a specific organization" do
            results = Ticket.closed_organization(organization)
            expect(results).to include(closed_ticket_with_organization)
            expect(results).to_not include(open_ticket_with_organization)
        end

        it "returns ickets of the specific region" do
            results = Ticket.region(region)
            expect(results).to include(open_ticket)
        end

        it "returns tickets category of a specific resource category" do
            results = Ticket.region(resource_category)
            expect(results).to include(open_ticket)
        end

    end

end

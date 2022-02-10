require 'rails_helper'

RSpec.describe Ticket, type: :model do

    let (:region) { create(:region) }
    let (:resource_category) { create(:resource_category) }

    let (:open_ticket) { Ticket.create!(
        closed: false,
        phone: "1-555-666-2244",
        name: "fake ticket",
        organization: nil,
        region: region,
        resource_category: resource_category,
    )}

    let (:closed_ticket) { Ticket.create!(
        closed: true,
        phone: "1-555-666-2244",
        name: "fake ticket",
        organization: nil,
        region: region,
        resource_category: resource_category,
    )}

    describe "scopes" do
        
        it "returns open tickets from database" do
            results = Ticket.open
            expect(results).to include(open_ticket)
            expect(results).to_not include(closed_ticket)
        end

    end

end

require 'rails_helper'

RSpec.describe Ticket, type: :model do

    describe "scopes" do
        describe "open" do
            open_ticket = Ticket.create!(closed: false, organization: nil)
            closed_ticket = Ticket.create!(closed: true)

            results = Ticket.open
            expect(results).to include(open_ticket)
            expect(results).to_not include(closed_ticket)
        end
    end

end


open_tickets = Ticket.open()
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do

    describe "#format_phone_number" do
        it "normalizes the number with US country code" do
            number = helper.format_phone_number("8314211816")
            expect(number).to eq("+18314211816")
        end
    end
end

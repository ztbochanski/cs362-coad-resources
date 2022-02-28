require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "an unauthenticated person" do
    it "redirects to the sign-in screen" do
    end
  end

  describe "an authenticated user" do
    it "redirects to the sign-in screen" do
      orgranization_user = create(:user)
      orgranization_user.confirm
      sign_in(orgranization_user)
    end
  end
  
end

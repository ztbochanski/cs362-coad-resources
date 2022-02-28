require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "an authenticated user" do
    it "redirects to the dashboard" do
      orgranization_user = create(:user)
      orgranization_user.confirm
      sign_in(orgranization_user)
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

end

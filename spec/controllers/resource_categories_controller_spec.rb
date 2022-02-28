require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  describe "an unauthenticated person" do
    it "redirects to the sign-in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "an authenticated user" do
    it "redirects to the dashboard" do
    end
  end

end

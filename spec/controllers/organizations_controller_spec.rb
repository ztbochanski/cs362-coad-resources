require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  
  describe "a non-logged in person" do
    it "redirects to sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "a logged in organization user" do
    it "redirects to the dashboard" do 
      organization_user = create(:user)
      organization_user.confirm
      sign_in(organization_user)
      post :approve, params: {id: "Fake"}
      expect(response).to redirect_to(dashboard_path)
      post :reject, params: {id: "Fake"}
      expect(response).to redirect_to(dashboard_path)
    end
  end

end

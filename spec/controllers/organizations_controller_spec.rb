require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  
  describe "a non-logged in person" do
    it "redirects to sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "a logged in organization user" do
    it "redirects to the dashboard" do 
      orgranization_user = create(:user)
      orgranization_user.confirm
      sign_in(orgranization_user)
    end
  end

end

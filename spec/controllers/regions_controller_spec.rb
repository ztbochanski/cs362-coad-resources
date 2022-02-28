require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  describe "a unauthenticated person accessing a region" do
    it "redirets to the sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      post :create
      expect(response).to redirect_to(new_user_session_path)
      post :edit, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "an authenticated person accessing a region" do
    it "redirects to the sign-in screen" do
      orgranization_user = create(:user)
      orgranization_user.confirm
      sign_in(orgranization_user)
      get :index
      expect(response).to redirect_to(dashboard_path)
      get :show, params: {id: "Fake"}
      expect(response).to redirect_to(dashboard_path)
      get :new
      expect(response).to redirect_to(dashboard_path)
      post :create
      expect(response).to redirect_to(dashboard_path)
      post :edit, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      put :update, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params: {id: 'Fake'}
      expect(response).to redirect_to(dashboard_path)
    end
  end

end

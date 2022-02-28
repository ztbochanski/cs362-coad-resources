require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  
  describe "a unauthenticated person accessing a region" do
    it "redirets to the sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :show, params: {id: "Fake"}
      expect(response).to redirect_to(new_user_session_path)
      
    end
  end

end

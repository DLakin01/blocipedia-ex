require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
      name: "Blochead",
      email: "blochead@blocipedia.com",
      password: "helloworld",
      password_confirmation: "helloworld"
    }
  end  

  describe "GET new" do
    it "has http status success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates a new user" do
      get :new
      expect(assigns(:user)).not_to be_nil
    end
  end

  describe "POST create" do
    it "returns an http redirect" do
      post :create, params: { user: new_user_attributes }
      expect(response).to have_http_status(:redirect)
    end

    it "creates a new user" do
      expect{ post :create, params: { user: new_user_attributes } }.to change(User, :count).by(1)
    end

    it "sets user details properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).name).to eq new_user_attributes[:name]
      expect(assigns(:user).email).to eq new_user_attributes[:email]
      expect(assigns(:user).password).to eq new_user_attributes[:password]
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end
  end
end

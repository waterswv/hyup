require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    it "creates new user" do
      user_params = {
        name: "Joe Blow",
        email: "hungey@eye.com",
        password:"1234",
        phone:"4151234567"
      }
      post :create, params: { user: user_params}
      expect(User.count).to eq(1)
    end
  end
end

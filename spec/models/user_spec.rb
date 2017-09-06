require 'rails_helper'

RSpec.describe User, type: :model do
  it "expects an email" do
    user = User.new
    user.valid?
    expect(user.errors.messages[:email]).to include("can't be blank")
  end
end

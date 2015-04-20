require 'rails_helper'

describe User do
  let(:user) { User.new(email: "test@test.test") }

  it "is a user" do
    expect(user).to be_a User
  end

  it "has an email" do
    expect(user.email).not_to be nil
  end


end

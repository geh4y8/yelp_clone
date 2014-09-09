require 'rails_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  it "validate case insensitive uniqueness of email" do
    user = User.create(email: "sample@gmail.com", password: "1234", password_confirmation: "1234")
    user2 = User.new(email: "sample@GMAIL.COM", password: "1234", password_confirmation: "1234")
    expect(user2.save).to eq false
  end

  it "requires the email address to look like an email" do
    user = User.create(email: "sample", password: "1234", password_confirmation: "1234")
    expect(user).to_not be_valid
  end
end

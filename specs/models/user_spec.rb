require './specs/test_helper'

describe User do
  describe '#create' do
    it "does not store passwords in plaintext" do
      u = User.create(email: "user@examples.com", password: "secret")
      u.password.wont_equal "secret"
    end

    it "enforces email uniqueness" do
      User.create(email: "user@examples.com", password: "secret")
      proc {User.create(email: "user@examples.com", password: "secret")}.must_raise Sequel::ValidationFailed
    end
  end
end


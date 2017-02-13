require './specs/test_helper'

describe Score do
  before do
    @lb = Leaderboard.create(leaderboard_name:"test leaderboard",
                                      leaderboard_type: "points")
    @reverse_lb = Leaderboard.create(leaderboard_name: "reversed",
                                     leaderboard_type: "points",
                                     reverse: true)
    @user = User.create(email:"example@email.com", password:"secret")
  end

  describe 'regular leaderboard' do
    it "updates score if higher" do
      s = Score.create(user: @user, leaderboard: @lb, value: 100)
      Score.upsert(user: @user, leaderboard: @lb, value: 150)
      s.reload.value.must_equal 150
    end

    it "does nothing if not higher" do
      s = Score.create(user: @user, leaderboard: @lb, value: 100)
      Score.upsert(user: @user, leaderboard: @lb, value: 50)
      s.reload.value.must_equal 100
    end
  end

  describe 'reversed leaderboard' do
    it "updates score if lower" do
      s = Score.create(user: @user, leaderboard: @reverse_lb, value: 100)
      Score.upsert(user: @user, leaderboard: @reverse_lb, value: 50)
      s.reload.value.must_equal 50
    end

    it "does nothing if higher" do
      s = Score.create(user: @user, leaderboard: @reverse_lb, value: 100)
      Score.upsert(user: @user, leaderboard: @reverse_lb, value:150)
      s.reload.value.must_equal 100
    end
  end
end


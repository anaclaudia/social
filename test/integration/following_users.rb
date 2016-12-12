require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rafael)
    @some_user = users(:nicolas)
    log_in_as(@user)
  end

  test "should follow a user" do
    assert_difference "@user.following.count", 1 do
      post relationships_path, params: { followed_id: @some_user.id }
    end
  end

  test "should unfollow a user" do
    @user.follow(@user)
    relationship = @user.active_relationships.find_by(followed_id: @some_user.id)
    assert_difference '@user.following.count', 1 do
      delete relationship_path(relationship)
    end
  end
end

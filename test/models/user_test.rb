require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(firstname: "Marko", lastname: "Wicked", password: "ddd009@", password_confirmation: "ddd009@", website: "www.markowicked.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

  test "fisrtname should be present" do
    @user.firstname = "  "
    assert_not @user.valid?
  end

  test "lastname should be present" do
    @user.lastname = " "
    assert_not @user.valid?
  end

  test "firstname shouldn't be greater than 15 characteres" do
    @user.firstname = "b"  * 16
    assert_not @user.valid?
  end

  test "lastname shouldn't be greater than 20 characteres" do
    @user.lastname = "b" * 21
    assert_not @user.valid?
  end

  test "should follow and unfollow a user" do
    rafael = users(:rafael)
    nicolas = users(:nicolas)
    assert_not rafael.following?(nicolas)
    rafael.follow(nicolas)
    assert rafael.following?(nicolas)
    rafael.unfollow(nicolas)
    assert_not rafael.following?(nicolas)
  end

end

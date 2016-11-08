require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(firstname: "Mark", lastname: "Wrick", website: "www.markwirck.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

  test "fisrtname should be present" do
    @user.firstname = ""
    assert_not @user.valid?
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(firstname: "Mark", lastname: "Wrick", website: "www.markwirck.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

end

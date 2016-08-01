require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
  def setup
    @user = User.new(username: 'BOB333', email: 'bob@example.com')
  end
    
  test "user should be valid" do
    assert @user.valid?
  end
  
  test "username must be present" do
    @user.username = ' '
    assert_not @user.valid?
  end
  
  test "username should be longer than 5 char" do
    @user.username = 'aa'
    assert_not @user.valid?
  end
    
  test "username should be less than 50 character" do
    @user.username = 'a' * 51
    assert_not @user.valid?
  end
  
  test "email must be present" do 
    @user.email = ' '
    assert_not @user.valid?
  end
  
  test "email should be longer than 15 characters" do 
    @user.email = 'a@example.com'
    assert_not @user.valid?
  end
  
  test " email should be shorter than 150 character" do 
    @user.email = 'a' * 151 + '@example.com'
    assert_not @user.valid?
  end
  
  test "email should be unique" do 
    cloned_recipe = @user.dup
    cloned_recipe.email = @user.email.upcase
    @user.save
    assert_not cloned_recipe.valid?
  end
  
  test "validation accepts valid email" do
    valid_addresses = %w[uuuuser@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]  
    valid_addresses.each do |valid|
      @user.email = valid
      assert @user.valid?, '#{valid.inspect} is not valid'
    end
  end
  
  
  test "validation rejects invalid email" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee++aar.com]
    invalid_addresses.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?, '#{invalid.inspect} is valid'    
    end
      
  end

end


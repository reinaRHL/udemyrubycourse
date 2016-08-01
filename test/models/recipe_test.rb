require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: 'Cooked Rice', summary: 'How to cook rice', 
                      description: 'Put water and rice in the rice cooker. Cook for 20 min') 
  end

  test "Recipe should be valid" do
    assert @recipe.valid?
  end
    
  test "Name must be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "Name should longer than 5 characters" do
    @recipe.name = 'a'
    assert_not @recipe.valid?
  end
  
  test "Name should be less than 20 char" do
    @recipe.name = "a" * 21 
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary should be longer than 10" do
    @recipe.summary = "aa"
    assert_not @recipe.valid?
  end
    
  test "summary shuld be less 150 characters" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
    
  test "description must be present" do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  
  test "description should be longer than 20 char" do
    @recipe.description = 'a' * 19
    assert_not @recipe.valid?
  end
    
  test "description should be less than 500 character" do
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end
  
end

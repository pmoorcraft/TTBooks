require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get about page title" do
    get :about
    assert_response :success
    assert_select "title", "Books and Videos for Entrepreneurs and Startups | TTBooks About"
  end
  
  test "should get archive page title" do
    get :archive
    assert_response :success
    assert_select "title", "Books and Videos for Entrepreneurs and Startups | TTBooks Archive"
  end
  
  
end

require 'test_helper'

class ManagerpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @managerpost = managerposts(:one)
  end

  test "should get index" do
    get managerposts_url
    assert_response :success
  end

  test "should get new" do
    get new_managerpost_url
    assert_response :success
  end

  test "should create managerpost" do
    assert_difference('Managerpost.count') do
      post managerposts_url, params: { managerpost: { content: @managerpost.content, published: @managerpost.published, title: @managerpost.title, user_id: @managerpost.user_id } }
    end

    assert_redirected_to managerpost_url(Managerpost.last)
  end

  test "should show managerpost" do
    get managerpost_url(@managerpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_managerpost_url(@managerpost)
    assert_response :success
  end

  test "should update managerpost" do
    patch managerpost_url(@managerpost), params: { managerpost: { content: @managerpost.content, published: @managerpost.published, title: @managerpost.title, user_id: @managerpost.user_id } }
    assert_redirected_to managerpost_url(@managerpost)
  end

  test "should destroy managerpost" do
    assert_difference('Managerpost.count', -1) do
      delete managerpost_url(@managerpost)
    end

    assert_redirected_to managerposts_url
  end
end

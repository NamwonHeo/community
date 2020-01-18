require "application_system_test_case"

class ManagerpostsTest < ApplicationSystemTestCase
  setup do
    @managerpost = managerposts(:one)
  end

  test "visiting the index" do
    visit managerposts_url
    assert_selector "h1", text: "Managerposts"
  end

  test "creating a Managerpost" do
    visit managerposts_url
    click_on "New Managerpost"

    fill_in "Content", with: @managerpost.content
    check "Published" if @managerpost.published
    fill_in "Title", with: @managerpost.title
    fill_in "User", with: @managerpost.user_id
    click_on "Create Managerpost"

    assert_text "Managerpost was successfully created"
    click_on "Back"
  end

  test "updating a Managerpost" do
    visit managerposts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @managerpost.content
    check "Published" if @managerpost.published
    fill_in "Title", with: @managerpost.title
    fill_in "User", with: @managerpost.user_id
    click_on "Update Managerpost"

    assert_text "Managerpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Managerpost" do
    visit managerposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Managerpost was successfully destroyed"
  end
end

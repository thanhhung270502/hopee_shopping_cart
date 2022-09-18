require "application_system_test_case"

class SuggestsTest < ApplicationSystemTestCase
  setup do
    @suggest = suggests(:one)
  end

  test "visiting the index" do
    visit suggests_url
    assert_selector "h1", text: "Suggests"
  end

  test "should create suggest" do
    visit suggests_url
    click_on "New suggest"

    click_on "Create Suggest"

    assert_text "Suggest was successfully created"
    click_on "Back"
  end

  test "should update Suggest" do
    visit suggest_url(@suggest)
    click_on "Edit this suggest", match: :first

    click_on "Update Suggest"

    assert_text "Suggest was successfully updated"
    click_on "Back"
  end

  test "should destroy Suggest" do
    visit suggest_url(@suggest)
    click_on "Destroy this suggest", match: :first

    assert_text "Suggest was successfully destroyed"
  end
end

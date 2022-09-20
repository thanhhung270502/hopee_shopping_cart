require "application_system_test_case"

class ReviewSuggestsTest < ApplicationSystemTestCase
  setup do
    @review_suggest = review_suggests(:one)
  end

  test "visiting the index" do
    visit review_suggests_url
    assert_selector "h1", text: "Review suggests"
  end

  test "should create review suggest" do
    visit review_suggests_url
    click_on "New review suggest"

    click_on "Create Review suggest"

    assert_text "Review suggest was successfully created"
    click_on "Back"
  end

  test "should update Review suggest" do
    visit review_suggest_url(@review_suggest)
    click_on "Edit this review suggest", match: :first

    click_on "Update Review suggest"

    assert_text "Review suggest was successfully updated"
    click_on "Back"
  end

  test "should destroy Review suggest" do
    visit review_suggest_url(@review_suggest)
    click_on "Destroy this review suggest", match: :first

    assert_text "Review suggest was successfully destroyed"
  end
end

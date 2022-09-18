require "test_helper"

class ReviewSuggestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_suggest = review_suggests(:one)
  end

  test "should get index" do
    get review_suggests_url
    assert_response :success
  end

  test "should get new" do
    get new_review_suggest_url
    assert_response :success
  end

  test "should create review_suggest" do
    assert_difference("ReviewSuggest.count") do
      post review_suggests_url, params: { review_suggest: {  } }
    end

    assert_redirected_to review_suggest_url(ReviewSuggest.last)
  end

  test "should show review_suggest" do
    get review_suggest_url(@review_suggest)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_suggest_url(@review_suggest)
    assert_response :success
  end

  test "should update review_suggest" do
    patch review_suggest_url(@review_suggest), params: { review_suggest: {  } }
    assert_redirected_to review_suggest_url(@review_suggest)
  end

  test "should destroy review_suggest" do
    assert_difference("ReviewSuggest.count", -1) do
      delete review_suggest_url(@review_suggest)
    end

    assert_redirected_to review_suggests_url
  end
end

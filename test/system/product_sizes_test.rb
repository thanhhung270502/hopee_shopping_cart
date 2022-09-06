require "application_system_test_case"

class ProductSizesTest < ApplicationSystemTestCase
  setup do
    @product_size = product_sizes(:one)
  end

  test "visiting the index" do
    visit product_sizes_url
    assert_selector "h1", text: "Product sizes"
  end

  test "should create product size" do
    visit product_sizes_url
    click_on "New product size"

    click_on "Create Product size"

    assert_text "Product size was successfully created"
    click_on "Back"
  end

  test "should update Product size" do
    visit product_size_url(@product_size)
    click_on "Edit this product size", match: :first

    click_on "Update Product size"

    assert_text "Product size was successfully updated"
    click_on "Back"
  end

  test "should destroy Product size" do
    visit product_size_url(@product_size)
    click_on "Destroy this product size", match: :first

    assert_text "Product size was successfully destroyed"
  end
end

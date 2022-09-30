require "application_system_test_case"

class UserVouchersTest < ApplicationSystemTestCase
  setup do
    @user_voucher = user_vouchers(:one)
  end

  test "visiting the index" do
    visit user_vouchers_url
    assert_selector "h1", text: "User vouchers"
  end

  test "should create user voucher" do
    visit user_vouchers_url
    click_on "New user voucher"

    click_on "Create User voucher"

    assert_text "User voucher was successfully created"
    click_on "Back"
  end

  test "should update User voucher" do
    visit user_voucher_url(@user_voucher)
    click_on "Edit this user voucher", match: :first

    click_on "Update User voucher"

    assert_text "User voucher was successfully updated"
    click_on "Back"
  end

  test "should destroy User voucher" do
    visit user_voucher_url(@user_voucher)
    click_on "Destroy this user voucher", match: :first

    assert_text "User voucher was successfully destroyed"
  end
end

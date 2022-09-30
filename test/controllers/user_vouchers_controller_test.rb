require "test_helper"

class UserVouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_voucher = user_vouchers(:one)
  end

  test "should get index" do
    get user_vouchers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_voucher_url
    assert_response :success
  end

  test "should create user_voucher" do
    assert_difference("UserVoucher.count") do
      post user_vouchers_url, params: { user_voucher: {  } }
    end

    assert_redirected_to user_voucher_url(UserVoucher.last)
  end

  test "should show user_voucher" do
    get user_voucher_url(@user_voucher)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_voucher_url(@user_voucher)
    assert_response :success
  end

  test "should update user_voucher" do
    patch user_voucher_url(@user_voucher), params: { user_voucher: {  } }
    assert_redirected_to user_voucher_url(@user_voucher)
  end

  test "should destroy user_voucher" do
    assert_difference("UserVoucher.count", -1) do
      delete user_voucher_url(@user_voucher)
    end

    assert_redirected_to user_vouchers_url
  end
end

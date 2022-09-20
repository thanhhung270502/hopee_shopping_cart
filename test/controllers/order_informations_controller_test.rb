require "test_helper"

class OrderInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_information = order_informations(:one)
  end

  test "should get index" do
    get order_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_order_information_url
    assert_response :success
  end

  test "should create order_information" do
    assert_difference("OrderInformation.count") do
      post order_informations_url, params: { order_information: { order_id: @order_information.order_id, status: @order_information.status } }
    end

    assert_redirected_to order_information_url(OrderInformation.last)
  end

  test "should show order_information" do
    get order_information_url(@order_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_information_url(@order_information)
    assert_response :success
  end

  test "should update order_information" do
    patch order_information_url(@order_information), params: { order_information: { order_id: @order_information.order_id, status: @order_information.status } }
    assert_redirected_to order_information_url(@order_information)
  end

  test "should destroy order_information" do
    assert_difference("OrderInformation.count", -1) do
      delete order_information_url(@order_information)
    end

    assert_redirected_to order_informations_url
  end
end

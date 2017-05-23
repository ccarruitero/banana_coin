require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = Account.create(address: Digest::SHA256.hexdigest('lalala'))
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end
end

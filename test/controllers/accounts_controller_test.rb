require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = Account.create(address: Digest::SHA256.hexdigest('lalala'))
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should redirect to new when account doesnt exist" do
    get account_url('noaccount')
    assert_response 302
  end

  test "should create account" do
    params = { password: 'blblabla', balance: 0 }
    assert_difference('Account.count') do
      post accounts_url, params: {
        account: params
      }
    end

    assert_redirected_to account_url(Account.last)
    assert_equal Account.last.address, Digest::SHA256.hexdigest(params[:password])
  end
end

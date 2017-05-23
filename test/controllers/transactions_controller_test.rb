require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = Account.create(address: Digest::SHA256.hexdigest('lalala'))
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post account_transactions_url(@account),
        params: {
          transaction: { amount: 200,
                         password: 'lalala',
                         description: 'some text',
                         instruction: 'deposito' } }

    end

    assert_redirected_to account_url(@account)
  end

  test "without correct password shouldnt create transaction" do
    assert_no_difference('Transaction.count') do
      post account_transactions_url(@account),
        params: {
          transaction: { amount: 200,
                         password: 'hiddenpass',
                         description: 'some text',
                         instruction: 'deposito' } }

    end

    assert_redirected_to account_url(@account)
  end
end

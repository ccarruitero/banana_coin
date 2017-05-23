class TransactionsController < ApplicationController
  before_action :set_account

  def create
    @transaction = @account.transactions.new(transaction_params.except(:password))

    respond_to do |format|
      if @account.verify(transaction_params) && @transaction.save
        format.html { redirect_to @account, notice: 'Transaction was successfully created.' }
      else
        format.html { redirect_to @account, notice: 'Transaction failed' }
      end
    end
  end

  private
    def set_account
      @account = Account.find(params[:account_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:account_id, :description, :amount, :instruction, :password)
    end
end

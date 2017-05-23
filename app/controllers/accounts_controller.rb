class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def show
  end

  private
    def set_account
      @account = Account.includes(:transactions).find_or_create_by(address: params[:id])
    end

    def account_params
      params.require(:account).permit(:address, :balance)
    end
end

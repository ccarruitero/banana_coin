class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def new
    @account = Account.new
  end

  def show
  end

  def create
    password = account_params[:password]
    final_params = account_params.except(:password).merge(address: Account.new.sha_address(password))
    @account = Account.new(final_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_account
      @account = Account.includes(:transactions).find_by_address(params[:id])
      redirect_to new_account_path unless @account
    end

    def account_params
      params.require(:account).permit(:address, :balance, :password)
    end
end

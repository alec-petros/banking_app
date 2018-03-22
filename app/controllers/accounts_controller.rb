class AccountsController < ApplicationController
  def show
    set_account
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    if params[:account][:customer_id].empty?
      params[:account][:customer_id] = Customer.find_or_create_by(name: params[:account][:customer]).id
    end
    @account = Account.new(acct_params)
    if @account.valid?
      @account.save
      redirect_to @account
    end
  end

  def destroy
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def acct_params
    params.require(:account).permit(:value, :bank_id, :customer_id)
  end
end

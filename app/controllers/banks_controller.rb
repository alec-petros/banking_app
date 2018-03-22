class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.valid?
      @bank.save
      redirect_to @bank
    else
      render :new
    end
  end

  def create_account
    @account = Account.new(bank_id: params[:id])
  end

  def show
    set_bank
  end

  def edit
    set_bank
  end

  def update
    set_bank
    if @bank.update(bank_params)
      redirect_to @bank
    else
      render :edit
    end
  end

  def destroy
    set_bank
    @bank.destroy
    redirect_to banks_path
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :city_id)
  end
end

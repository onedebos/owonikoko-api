class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :destroy, :update]
    def index
      @accounts = Account.all.order(created_at: :desc)
      render json: @accounts, status: :ok
    end

    def create
      @account = Account.create!(account_params)
      render json: @account, status: :created
    end

    def update
      @account.update(account_params)
      render json: @account
    end

    def show
      render json: @account, satus: :ok
    end

    def destroy
      @account.destroy
      head :no_content
    end

private
  def account_params
    params.permit(:name, :bank, :acc_no, :category)
  end

  def set_account
    @account = Account.find(params[:id])
  end

end

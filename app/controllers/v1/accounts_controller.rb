module V1
  class AccountsController < ApplicationController
    include AccountsHandler

    before_action :set_account, only: [:update, :destroy]
  
    # GET /accounts
    def index
      @accounts = Account.all
  
      render json: @accounts, include: [:person]
    end
  
    # GET /accounts/1
    def show
      accounts = get_account_with_childs_array(params[:id])
      response = account_with_childs_json_build(accounts)

      render json: response[:data], status: response[:status]
    end
  
    # POST /accounts
    def create
      @account = Account.new(account_params)
  
      if @account.save
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /accounts/1
    def update
      if @account.update(account_params)
        render json: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /accounts/1
    def destroy
      @account.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account
        @account = Account.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def account_params
        params.require(:account).permit(:name, :balance, :kind, :status, :parent_account_id, :person_id)
      end
  end
end

class AccountRegistrationsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :destroy]
    def index
        @accounts = Account.all
        render json: @accounts, status: 200
    end

    def show
        render json: @account, status: 200
    end

    def new
        @account = Account.new
    end

    def create
        @account = Account.find_by(user_id: params[:user_id])
        unless @account.present?
            @account = Account.new(account_params)
            save_account
        else
            render json: { error: { type: "UNAUTHORIZED", message: "Account already exist... Please login" } }, status: 403
        end
    end

    def destroy
        @account.destroy
    end

    def save_account
        if @account.save!
            token = jwt_encode(user_id: @account.id)
            set_headers(token)
            render json: {message: 'Account Created Successfully'}, status: 200
        else
            render json: {"error" => "Unprocessable Entity"}
        end
    end

    private

    def account_params
        params.require(:account_registration).permit(:user_id, :password, :password_confirmation)
    end

    def set_headers(token)
        response.headers['AUTH-TOKEN'] = token
    end

    def set_user
        @account = Account.find(params[:id])
    end
end



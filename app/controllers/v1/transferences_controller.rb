module V1
  class TransferencesController < ApplicationController
    before_action :set_transference, only: [:show, :update, :destroy]

    # GET /transferences
    def index
      @transferences = Transference.all

      render json: @transferences
    end

    # GET /transferences/1
    def show
      render json: @transference
    end

    # POST /transferences
    def create
      @transference = Transference.new(transference_params)

      if @transference.save
        render json: @transference, status: :created
      else
        render json: @transference.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /transferences/1
    def update
      if @transference.update(transference_params)
        render json: @transference
      else
        render json: @transference.errors, status: :unprocessable_entity
      end
    end

    # DELETE /transferences/1
    def destroy
      @transference.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_transference
        @transference = Transference.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def transference_params
        params.require(:transference).permit(:amount, :sender_account_id, :receiver_account_id)
      end
  end
end

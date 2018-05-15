module V1
  class PeopleController < ApplicationController
    has_scope :by_kind

    before_action :set_person, only: [:show, :update, :destroy]
  
    # GET /people
    def index
      @people = apply_scopes(Person).all
  
      render json: @people
    end
  
    # GET /people/1
    def show
      render json: @person
    end
  
    # POST /people
    def create
      @person = Person.new(person_params)
  
      if @person.save
        render json: @person, status: :created
      else
        render json: @person.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /people/1
    def update
      if @person.update(person_params)
        render json: @person
      else
        render json: @person.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /people/1
    def destroy
      @person.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def person_params
        params.require(:person).permit(:cpf_cnpj, :business_name, :name, :bday, :kind)
      end
  end
end

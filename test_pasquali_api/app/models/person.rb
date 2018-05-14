class Person < ApplicationRecord
  enum type: [:individual_taxpayers, :business_taxpayers]

  validates :cpf_cnpj,
    uniqueness: true,
    on: :create
  validates :name,
    presence: true
  validates :business_name,
    presence: true,
    if: :is_business?
  validates :bday,
    presence: true,
    unless: :is_business?
  validates :type,
    presence: true

  private
    def is_business
      type === 1
    end
end

class Person < ApplicationRecord
  enum kind: [:individual_taxpayers, :business_taxpayers]

  has_one :accounts,
    dependent: :destroy

  validates :cpf_cnpj,
    presence: true,
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

  validates :kind,
    presence: true

  def is_business?
    kind == 'business_taxpayers'
  end
end

class Account < ApplicationRecord
  enum kind: [
    :matrix,
    :units
  ]
  enum status: [
    :activated,
    :blocked,
    :canceled
  ]

  belongs_to :person

  validates :name, :balance, :kind, :status,
    presence: true

  validates :person,
    uniqueness: true

  validates :parent_account_id,
    presence: true,
    unless: :is_matrix?

  def is_matrix?
    kind == 'matrix'
  end
end

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

  scope :by_kind, ->(kind) { where("kind = ?", kind) }
  scope :by_status, ->(status) { where("status = ?", status) }

  belongs_to :person

  validates :name, :balance, :init_date, :kind, :status,
    presence: true

  validates :person_id,
    uniqueness: true

  validates :parent_account_id,
    presence: true,
    unless: :is_matrix?

  def is_matrix?
    kind == 'matrix'
  end
end

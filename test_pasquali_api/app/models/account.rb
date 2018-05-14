class Account < ApplicationRecord
  enum kind: [:matrix, :units]
  enum status: [:activated, :blocked, :canceled]

  has_many :childs,
    class_name: 'Account', 
    foreign_key: "parent_account_id",
    inverse_of: 'Account'

  belongs_to :parent_account,
    class_name: 'Account',
    foreign_key: "parent_account_id",
    optional: true

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

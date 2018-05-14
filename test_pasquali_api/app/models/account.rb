class Account < ApplicationRecord
  enum type: [:matrix, :units]
  enum status: [:activated, :blocked, :canceled]

  has_many :childs, class_name: 'Account', 
    foreign_key: "parent_account_id", inverse_of: 'Account'

  belongs_to :parent_account, class_name: 'Account',
    foreign_key: "parent_account_id"
  belongs_to :person

  validates :name, :balance, :kind, :status,
    presence: true

  validates :person,
    uniqueness: true
end

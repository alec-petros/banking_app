class Bank < ApplicationRecord
  belongs_to :city
  has_many :accounts
  has_many :customers, through: :accounts
end

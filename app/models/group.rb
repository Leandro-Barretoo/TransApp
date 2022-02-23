class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 150 }
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :buys

  def total
    buys.sum('amount')
  end
end

class Buy < ApplicationRecord
    validates :name, :amount, :groups, presence: true, length: { maximum: 150 }
    validates :amount, numericality: { greater_than: 0 }

    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :groups
end

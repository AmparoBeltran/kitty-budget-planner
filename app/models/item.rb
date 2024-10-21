class Item < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :frequency, presence: true

    scope :ordered, -> { order(id: :desc) }
end

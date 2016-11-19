class Food < ApplicationRecord
  belongs_to :restaurant

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0.01 }

  validates :name, presence: true,
                   uniqueness: true,
                   length: { in: 2..30 },
                   allow_blank: false

  validates :description, presence: true,
                          length: { maximum: 300 },
                          allow_blank: false
end

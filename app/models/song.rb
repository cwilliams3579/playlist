class Song < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :users, through: :selections
  validates :artist, :title, presence: true, length: { in: 2..20 }
end

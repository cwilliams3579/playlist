class Selection < ApplicationRecord
#  has_many :songs
  belongs_to :song
  belongs_to :user
  validates :song, :user, presence:true
  validates :count, presence:true, numericality:{ only_integer:true }
end

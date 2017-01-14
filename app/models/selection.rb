class Selection < ApplicationRecord
  belongs_to :user
  belongs_to :song
  validates :song, :user, presence:true
  validates :count, presence:true, numericality:{ only_integer:true }
end

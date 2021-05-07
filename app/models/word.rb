class Word < ApplicationRecord
  
  belongs_to :member
  belongs_to :genre
  has_many :likes, dependent: :destroy
  
end

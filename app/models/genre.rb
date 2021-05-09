class Genre < ApplicationRecord
  
  has_many :word_genres
  has_many :words, through: :word_genres
  
end

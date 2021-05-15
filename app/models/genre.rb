class Genre < ApplicationRecord
  
  has_many :word_genres
  has_many :words, through: :word_genres
  
  def self.search(search, text)
    if search == 'perfect'
      Genre.where(name: "#{text}")
    else
      Genre.where('name LIKE ?', "%#{text}%")
    end
  end
end

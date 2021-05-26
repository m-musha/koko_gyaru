# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :word_genres
  has_many :words, through: :word_genres

  validates :name, presence: true

  def self.search(search, text)
    if search == 'perfect'
      Genre.where(name: text.to_s)
    else
      Genre.where('name LIKE ?', "%#{text}%")
    end
  end
end

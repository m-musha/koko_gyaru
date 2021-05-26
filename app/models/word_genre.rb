# frozen_string_literal: true

class WordGenre < ApplicationRecord
  belongs_to :word
  belongs_to :genre
end

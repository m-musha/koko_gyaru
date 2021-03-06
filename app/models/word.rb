# frozen_string_literal: true

class Word < ApplicationRecord
  # ジャンルとアソシエーション
  #has_many :word_genres
  #has_many :genres, through: :word_genres
  #has_one :word_genre, dependent: :destroy
  belongs_to :genre

  has_many :likes, dependent: :destroy
  belongs_to :member

  # 別々のモデルを同時に保存しやすくする
  # カラム自体は存在しないけど、カラムのように使うことができる
  #accepts_nested_attributes_for :word_genres

  def liked_by?(member)
    likes.where(member_id: member.id).exists?
  end

  # 検索機能
  def self.search(search, text)
    if search == 'perfect'
      Word.where(sentence: text.to_s)
    else
      Word.where('sentence LIKE ?', "%#{text}%")
    end
  end

  # いいね数のランキング機能
  def self.create_all_ranks
    Word.find(Like.group(:word_id).order('count(word_id) desc').limit(5).pluck(:word_id))
  end

  validates :sentence, presence: true, length: { maximum: 181 }
end

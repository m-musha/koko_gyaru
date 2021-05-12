class Word < ApplicationRecord

  has_many :likes, dependent: :destroy
  has_many :word_genres
  has_many :genres, through: :word_genres
  belongs_to :member

  #別々のモデルを同時に保存しやすくする
  #カラム自体は存在しないけど、カラムのように使うことができる
  accepts_nested_attributes_for :word_genres

  def liked_by?(member)
    likes.where(member_id: member.id).exists?
  end

  def self.search(search, text)
    if search == 'perfect'
      @word = Word.where(sentence: "#{text}")
    else
      @word = Word.where("sentence LIKE ?", "%#{text}%")
    end
  end

end
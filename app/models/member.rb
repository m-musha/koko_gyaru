class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :words, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image, destroy: false

#検索機能
  def self.search(search, text)
    if search == 'perfect'
      Member.where(name: "#{text}")
    else
      Member.where('name LIKE ?', "%#{text}%")
    end
  end
  
  validates :email, presence: true
  validates :name, length: {maximum: 15, minimum: 1}, uniqueness: true

end


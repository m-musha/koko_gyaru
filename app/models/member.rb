class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :words, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image, destroy: false

  def self.search(search, text)
    if search == 'perfect'
      @member = Member.where(name: "#{text}")
    else
      @member = Member.where('name LIKE ?', "%#{text}%")
    end
  end

end


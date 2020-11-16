class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  
  validates :introduction, length: { maximum: 50 }
  
  
  # モデル名を複数形で記述
  has_many :books, dependent: :destroy
  # attachmentを使うことで、画像を貼り付けることができる
  attachment :profile_image
  
end

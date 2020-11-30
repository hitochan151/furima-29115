class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :birth_day, presence: true
    validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    
    with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
     validates :family_name
     validates :first_name
    end

    with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
     end
      
  end

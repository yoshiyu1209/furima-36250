class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    with_options format:{with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :last_name
      validates :first_name
    end

    with_options format:{with: /\A[ァ-ヶ一-]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birthday

  end

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/
  #     validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }


end

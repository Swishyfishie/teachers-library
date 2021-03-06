class User < ApplicationRecord
  has_many :books
  has_many :lesson_plans
  validates :user_name, format: { with: /[a-zA-Z]/, message: "Your name cannot contain numbers or symbols." }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # def make_title_case 
  #   self.user_name = self.user_name.titlecase
  # end 

end



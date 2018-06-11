class User < ApplicationRecord
  has_many :authentication_tokens
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :token_authenticatable, :validatable
end

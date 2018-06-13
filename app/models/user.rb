class User < ApplicationRecord
  has_many :authentication_tokens
  has_many :encrypted_files
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :token_authenticatable, :validatable
end

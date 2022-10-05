class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :recipes, dependent: :delete_all
  has_many :foods, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
=======

  has_many :foods
  has_many :recipes, foreign_key: 'user_id', class_name: 'Recipe'
>>>>>>> 38ac739680ed8efea405d95ad9337f723384fb31
end

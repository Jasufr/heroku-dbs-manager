class FrnshrUser < ApplicationRecord
  has_many :frnshr_rooms
  has_many :frnshr_planners, through: :frnshr_rooms
  has_many :frnshr_wishlists, through: :frnshr_rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

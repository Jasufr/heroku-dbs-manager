class FrnshrWishlist < ApplicationRecord
  belongs_to :frnshr_room
  belongs_to :frnshr_item
  has_one :frnshr_user, through: :frnshr_room
end

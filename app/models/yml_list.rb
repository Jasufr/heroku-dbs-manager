class YmlList < ApplicationRecord
  has_many :yml_bookmarks, dependent: :destroy
  has_many :yml_movies, through: :yml_bookmarks
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end

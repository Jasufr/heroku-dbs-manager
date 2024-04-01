class YmlMovie < ApplicationRecord
  has_many :yml_bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end

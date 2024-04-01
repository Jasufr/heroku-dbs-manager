class YmlBookmark < ApplicationRecord
  belongs_to :yml_movie
  belongs_to :yml_list

  validates :yml_movie_id, :yml_list_id, presence: true
  validates :yml_movie_id, uniqueness: { scope: :yml_list_id }
  validates :comment, length: { minimum: 6, maximum: 21 }, if: -> { comment.present? }
end

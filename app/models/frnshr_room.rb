class FrnshrRoom < ApplicationRecord
  belongs_to :frnshr_user
  has_many :frnshr_wishlists, dependent: :destroy
  has_many :frnshr_planners, dependent: :destroy
  has_many :frnshr_planner_items, through: :frnshr_planners, source: :frnshr_item
  has_many :frnshr_wish_items, through: :frnshr_wishlists, source: :frnshr_item

  validates :room_type, presence: true
  validates :palette, presence: true
  ROOMS = ['kitchen', 'bathroom', 'bedroom', 'living', 'dining', 'garden', 'kids']
  validates :room_type, inclusion: { in: ROOMS }

  def total_area
    frnshr_planner_items.sum { |item| item.surface_area }
  end

  def area_by_colors
    planners.joins(:frnshr_item).group('frnshr_planners.id', 'frnshr_items.color').each_with_object({}) do |planner, result|
      color = planner.item.color
      surface_area = planner.item.surface_area
      result[color] ||= 0
      result[color] += surface_area
    end
  end
end

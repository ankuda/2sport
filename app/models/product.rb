class Product < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :cover
  belongs_to :building

  has_many   :books

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :cover
  accepts_nested_attributes_for :building

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true

  def size
    "#{height}x#{width}x#{length}"
  end

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end

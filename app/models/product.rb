class Product < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :size
  belongs_to :cover
  belongs_to :building

  has_many   :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end

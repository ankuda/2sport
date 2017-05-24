class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :product

  def time
    new_record? ? self[:time] : self[:time].to_time
  end
end

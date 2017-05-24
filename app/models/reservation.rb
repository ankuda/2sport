class Reservation < ApplicationRecord
  belongs_to :book
  belongs_to :product

  before_save :check_time

  def time
    new_record? ? self[:time] : self[:time].to_time
  end

  private

  def check_time
    false if self.time.nil?
  end
end

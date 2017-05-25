class Book < ApplicationRecord
  has_many :reservations
  has_many :products, through: :reservations

  validates :name, :email, presence: true

  accepts_nested_attributes_for :reservations, reject_if: :time_blank?

  private

  def time_blank?(attrs)
    attrs['time'].blank? && new_record?
  end
end

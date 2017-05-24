class Product < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :cover
  belongs_to :building

  has_many :reservations
  has_many :books, through: :reservations

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :cover
  accepts_nested_attributes_for :building

  validates :title, presence: true

  def size
    "#{height}x#{width}x#{length}"
  end

  def seven_days
    Date.today.upto(Date.today + 6)
  end

  def start_working
    self[:start_working].to_time.in_time_zone('Moscow')
  end

  def end_working
    self[:end_working].to_time.in_time_zone('Moscow')
  end

  def working_hours
    ((end_working.to_time.in_time_zone("Moscow") - start_working.to_time.in_time_zone("Moscow"))/3600).to_i
  end
end

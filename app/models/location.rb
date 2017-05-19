class Location < ApplicationRecord
  belongs_to :country
  belongs_to :city

  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :city
end

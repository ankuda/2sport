class Category < ApplicationRecord
  has_one :category
  accepts_nested_attributes_for :category
end

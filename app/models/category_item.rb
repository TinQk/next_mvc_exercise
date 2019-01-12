# frozen_string_literal: true

class CategoryItem < ApplicationRecord
  belongs_to :category
  belongs_to :item
end

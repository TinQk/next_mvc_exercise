# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  def price
    price = if has_discount == false
              original_price
            else
              original_price - original_price * discount_percentage / 100
            end
    price.to_f.round(2)
  end

  def self.average_price
    sum = 0 # count total prices summed before division
    n = 0 # count items
    find_each do |item|
      sum += item.price
      n += 1
    end
    (sum / n).to_f
  end
end

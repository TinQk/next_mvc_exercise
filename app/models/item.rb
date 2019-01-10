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

  def price
    price = 0.0
    if self.has_discount == false
      price = self.original_price
    else
      price = self.original_price - self.original_price * self.discount_percentage / 100
    end
    price = price.to_f.round(2)
    return price
  end

  def self.average_price
    sum = 0 #count total prices summed before division
    n = 0 #count items
    self.all.each do |item|
      sum += item.price
      n += 1
    end
    avg = sum/n
    return avg.to_f
  end

end

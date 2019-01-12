# frozen_string_literal: true

FactoryBot.define do
  factory :category_item do
    category { "MyString" }
    item { "MyString" }
  end
end

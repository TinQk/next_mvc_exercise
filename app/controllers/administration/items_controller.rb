# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all
    end

    def update
      puts "params : #{params}"
      item = Item.find(params[:id])
      discount = params[:item]["discount_percentage"].to_i
      item.discount_percentage = discount
      item.has_discount = if discount.positive? && discount <= 100
                            true
                          else
                            false
                          end
      item.save
      redirect_to administration_items_path
    end
  end
end

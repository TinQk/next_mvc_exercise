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
      if discount > 0 && discount <= 100
        item.has_discount = true
      else
        item.has_discount = false
      end
      item.save
      redirect_to administration_items_path
    end
  end
end

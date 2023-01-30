class Item < ApplicationRecord
   has_many :cart_items
   has_many :order_items
   has_one_attached :image

   def tax_in_price
     (price*1.1).floor
   end
end

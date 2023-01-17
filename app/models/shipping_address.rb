class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to              :purchase_history
  belongs_to              :trading_status
end

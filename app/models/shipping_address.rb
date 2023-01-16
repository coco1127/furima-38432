class ShippingAddress < ApplicationRecord
  belongs_to              :purchase_history
  belongs_to              :trading_status
end

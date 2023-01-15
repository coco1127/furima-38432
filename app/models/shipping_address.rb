class ShippingAddress < ApplicationRecord
  belongs_to              :purchase_history
  belongs_to_active_hash  :trading_status
end

class PurchaseShipping 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :house_number, :building_name, :phone_number,:trading_status_id,:purchase_history_id,:token
  

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    #validates :purchase_history_id
    validates :user_id
    validates :item_id
    validates :token
  end
    validates :trading_status_id, numericality:  { other_than: 1, message: "can't be blank" }
             

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, trading_status_id: trading_status_id, purchase_history_id: purchase_history.id )
  end
end



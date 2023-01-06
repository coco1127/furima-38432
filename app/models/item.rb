class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_condition
belongs_to :preparation_day 
belongs_to :postage_payer   
belongs_to :category  
belongs_to :trading_status
has_one_attached :image
has_one :purchase_history
belongs_to :user

validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
validates :preparation_day_id, numericality:  { other_than: 1 , message: "an't be blank"} 
validates :postage_payer_id, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :category_id, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :trading_status_id, numericality:  { other_than: 1 , message: "can't be blank"} 

validates :name,                   presence: true
validates :introduction,           presence: true
validates :price,                  format: { with: /\A[0-9]+\z/, message: 'Price is invalid. Input half-width characters' }
validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

validates :image,                  presence: true
validates :item_condition,         presence: true
validates :preparation_day,        presence: true
validates :postage_payer,          presence: true
validates :category,               presence: true
validates :trading_status,         presence: true
validates :price,                  presence: true

def was_attached?
  self.image.attached?
end
end

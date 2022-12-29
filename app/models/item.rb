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
validates :preparation_day_id, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :postage_payer_id, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :category_id, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :trading_status_id, numericality:  { other_than: 1 , message: "can't be blank"} 

validates :name,                   presence: true
validates :introduction,           presence: true
validates :price,                  presence: true
validates :image,                  presence: true
end
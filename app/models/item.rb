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

validates :item_condition, numericality: { other_than: 1 , message: "can't be blank"} 
validates :preparation_day, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :postage_payer, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :category, numericality:  { other_than: 1 , message: "can't be blank"} 
validates :trading_status, numericality:  { other_than: 1 , message: "can't be blank"} 

validates :name,            :string,	       presence: true
validates :introduction,    :text,           presence: true
validates :price,           :integer,        presence: true
     
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_condition
  belongs_to :preparation_day
  belongs_to :postage_payer
  belongs_to :category
  belongs_to :trading_status
  has_one_attached :image
  has_one     :purchase_history
  belongs_to  :user

  validates :item_condition_id, numericality: { other_than: 1, message: 'を選択して下さい'}
  validates :preparation_day_id, numericality:  { other_than: 1,  message: 'を選択して下さい'}
  validates :postage_payer_id, numericality: { other_than: 1,  message: 'を選択して下さい'}
  validates :category_id, numericality: { other_than: 1,  message: 'を選択して下さい' }
  validates :trading_status_id, numericality:  { other_than: 1, message: 'を選択して下さい'}

  validates :name,                   presence: true
  validates :introduction,           presence: true
  validates :price,                  format: { with: /\A[0-9]+\z/, message: 'は半角で入力して下さい' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は範囲内で設定して下さい' }

  validates :image,                  presence: true 
  validates :item_condition,         presence: true
  validates :preparation_day,        presence: true
  validates :postage_payer,          presence: true
  validates :category,               presence: true
  validates :trading_status,         presence: true
  validates :price,                  presence: true

  def was_attached?
    image.attached?
  end
end

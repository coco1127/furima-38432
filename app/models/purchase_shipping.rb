class PurchaseShipping < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :house_number, :building_name, :phone_number,:trading_status_id,:purchase_history_id
  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
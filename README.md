## users テーブル
|Column	               |Type	  |Options
|----------------------|--------|---------------
|nickname	             |string	|null: false
|encrypted_password    |string	|null: false
|email	               |string	|null: false,unique: true
|first_name	           |string	|null: false
|family_name	         |string	|null: false
|first_name_kana	     |string	|null: false
|family_name_kana	     |string	|null: false
|birth_date            |date	  |null: false    

- has_many : items
- has_one : purchase_history


## purchase_historiesテーブル
|Column 	           |Type       |Options
|--------------------|-----------|--------------------------------
|user                |references |null: false, foreign_key: true
|item                |references |null: false, foreign_key: true

- belongs_to :user
- belongs_to :item
- has_one : shipping_address


## itemsテーブル
|Column           	 |Type	       |Options
|--------------------|-------------|-----------------------------
|name	               |string	     |null: false
|introduction        |text         |null: false
|price               |integer	     |null: false
|item_condition_id   |integer	     |null: false
|preparation_day_id  |integer	     |null: false
|postage_payer_id    |integer	     |null: false
|category_id         |integer	     |null: false
|trading_status_id   |integer	     |null: false
|user                |references   |null: false, foreign_key: true

- has_one_attached :image
- belongs_to_active_hash: item_condition
- belongs_to_active_hash: preparation_day 
- belongs_to_active_hash: postage_payer   
- belongs_to_active_hash: category 
- belongs_to_active_hash: trading_status
- has_many : purchase_history


## shipping_addressテーブル
|Column           	 |Type	       |Options
|--------------------|-------------|-----------------------------
|post_code           |string	     |null: false
|city                |string	     |null: false
|house_number        |string	     |null: false
|building_name       |string	     
|phone_number        |string	     |null: false
|trading_status_id   |integer	     |null: false
|purchase_history 　 |references   |null: false, foreign_key: true

- belongs_to : purchase_history
- belongs_to_active_hash: trading_status

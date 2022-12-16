## users テーブル
|Column	               |Type	  |Options
|----------------------|--------|---------------
|nickname	             |string	|null: false
|password              |string	|null: false
|password_confirmation |string	|null: false
|email	               |string	|null: false,unique: true
|first_name	           |string	|null: false
|family_name	         |string	|null: false
|first_name_kana	     |string	|null: false
|family_name_kana	     |string	|null: false
|post_code             |string	|null: false
|city                  |string	|null: false
|house_number          |string	|null: false
|building_name         |string  |
|phone_number          |string	|unique: true
|birth_date            |date	  |null: false    

- has_many :seller_items
- has_many :buyer_items
- has_one :profile
- has_one :purchase_history


## Purchase_historiesテーブル
|Column 	           |Type       |Options
|--------------------|-----------|--------------------------------
|user                |references |null: false, foreign_key: true
|item                |string	   |null: false, foreign_key: true

- belongs_to :user
- has_many :items


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
|seller              |references   |null: false, foreign_key: true
|buyer               |references   |null: false, foreign_key: true

- belongs_to :seller ,class_name: "User" 
- belongs_to :buyer ,class_name: "User" 
- belongs_to :category
- has_many :images 
- belongs_to_active_hash: item_condition
- belongs_to_active_hash: preparation_day 
- belongs_to_active_hash: postage_payer   
- belongs_to_active_hash: category 
- belongs_to_active_hash: trading_status



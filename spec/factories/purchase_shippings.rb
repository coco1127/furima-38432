FactoryBot.define do
  factory :purchase_shipping do
post_code         { '123-4567' }
city              { '東京都' }
house_number      { '1-1' }
building_name     { '東京ハイツ' }  
phone_number       {'09000000000'}
trading_status_id   { 6 }
             

  end
end



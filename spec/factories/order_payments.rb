FactoryBot.define do
      factory :order_payment do
        postcode      { 111-1111 }
        prefecture_id { 1 }
        city          { "大阪市" }
        block         { "大阪6-5" }
        building      { "大阪ビル" }
        phone_number  { 11111111111 }
    
  end
end

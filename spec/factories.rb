FactoryGirl.define do
  factory :match do
    request nil
    post nil
    weight 1
  end
  factory :request do
    user nil
    body "MyString"
  end
  factory :post do
    user_id 1
    vendor_id 1
    item_id 1
  end
  factory :item do
    name "MyString"
  end
  factory :vendor do
    name "MyString"
    lat 1.5
    lng 1.5
  end
  factory :user do
    
  end
end

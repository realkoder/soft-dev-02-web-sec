FactoryBot.define do
  factory :subscription_plan do
    name { "MyString" }
    price { "9.99" }
    billing_cycle { "MyString" }
    feature_description { "MyString" }
  end
end

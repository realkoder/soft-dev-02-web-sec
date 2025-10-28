FactoryBot.define do
  factory :invoice do
    user { nil }
    subscription { nil }
    amount { "9.99" }
    currency { "MyString" }
    status { "MyString" }
    paid_at { "2025-09-16 18:02:01" }
  end
end

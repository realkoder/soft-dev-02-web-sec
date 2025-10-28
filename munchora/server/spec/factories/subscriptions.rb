FactoryBot.define do
  factory :subscription do
    user { nil }
    subscription_plan { nil }
    current_period_start { "2025-09-16 17:54:40" }
    current_period_end { "2025-09-16 17:54:40" }
    cancelled_at { "2025-09-16 17:54:40" }
    status { "MyString" }
  end
end

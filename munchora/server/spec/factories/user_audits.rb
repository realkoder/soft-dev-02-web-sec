FactoryBot.define do
  factory :user_audit do
    user { nil }
    operation { "MyString" }
    old_data { "" }
    changed_data { "" }
    created_at { "2025-09-25 15:16:18" }
  end
end

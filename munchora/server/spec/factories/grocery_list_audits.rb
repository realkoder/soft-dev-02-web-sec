FactoryBot.define do
  factory :grocery_list_audit do
    grocery_list { nil }
    user { nil }
    operation { "MyString" }
    old_data { "" }
    changed_data { "" }
  end
end

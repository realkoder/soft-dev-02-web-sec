FactoryBot.define do
  factory :grocery_list_item_audit do
    grocery_list_item { nil }
    user { nil }
    operation { "MyString" }
    old_data { "" }
    changed_data { "" }
  end
end

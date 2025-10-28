FactoryBot.define do
  factory :feedback do
    message { "Great app - please add tracking for calories, protein, vitamine etc." }
    name { "Alexander Christensen" }
    category { "features" }
    email { "alexander@gmail.com" }
  end
end

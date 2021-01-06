FactoryBot.define do
  factory :category do
    label { "MyString" }
    order { 1 }
    budget { "9.99" }
    board { nil }
    parent { nil }
  end
end

FactoryBot.define do
  factory :expense do
    amount { "9.99" }
    description { "MyString" }
    payee { nil }
    board { nil }
    category { nil }
    currency { nil }
    date { "2021-01-06 17:23:42" }
    pending { false }
    exchange_rate { "9.99" }
  end
end

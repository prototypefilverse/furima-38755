FactoryBot.define do
  factory :user do
    nickname              { 'sample' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
    first_name            { '太朗' }
    family_name           { '山田' }
    first_name_kana       { 'タロウ' }
    family_name_kana      { 'ヤマダ' }
    birth_day             { '2000-01-01' }
  end
end

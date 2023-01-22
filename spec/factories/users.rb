FactoryBot.define do
  factory :user do
    transient do
      person{ Gimei.name}
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name            {person.last.kanji}
    last_name             {person.first.kanji}
    first_name_yomi       {person.last.katakana}
    last_name_yomi        {person.first.katakana}
    birthday              {Faker::Date.backward}
  end
end
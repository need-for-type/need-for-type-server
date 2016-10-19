FactoryGirl.define do
  factory :score do
    username { Faker::Internet.user_name }
    text_id { rand(100) }
    wpm { rand(200) }
    time { rand * rand(1000) }
    accuracy { rand * rand(100) }

    trait :invalid do
      username nil
    end
  end
end

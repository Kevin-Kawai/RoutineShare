FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "password"
    password_confirmation "password"
  end

  factory :routine do
    name "Awesome Routine"
    description "Best routine ever"
    association :user
  end

  factory :activity do
    name "Awesome Activity"
    description "Awesome Activity description"
    association :routine
  end
end

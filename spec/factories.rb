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
end

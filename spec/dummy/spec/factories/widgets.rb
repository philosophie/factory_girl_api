FactoryGirl.define do
  factory :widget do
    name 'WIDGET NAME'
    price 1

    trait :expensive do
      price 1000
    end
  end
end

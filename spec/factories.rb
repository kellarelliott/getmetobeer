FactoryBot.define do

  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :comment do
    message { "This place is awesome" }
    rating { 5 }
    brewery_db_id { "zarh_Lkjsd"}
    location { "Breck on Blake"}
    association :user
  end
end

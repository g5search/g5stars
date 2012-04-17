FactoryGirl.define do 
  factory :volunteer do
    sequence(:first_name) {|n| "Joe#{n}"}
    last_name "Smith"
  end
  factory :star do
    volunteer
    activity "tie my shoes"
    board_member false
  end
  factory :user do
    sequence(:email) {|n| "admin#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end
end

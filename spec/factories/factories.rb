FactoryGirl.define do

  factory :volunteer do
    sequence(:first_name) {|n| "Joe#{n}"}
    last_name "Smith"

    factory :volunteer_who_donated_blood do
      after(:create) do |v|
        FactoryGirl.create(:blood_star, :volunteer => v)
      end
    end
  end

  factory :star do
    board_member false
    activity_name "tie my shoes"

    factory :blood_star do
      association(:activity, :name => "Donated Blood")
    end
  end

  factory :user do
    sequence(:email) {|n| "admin#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :activity do
    name "some activity"
  end

  factory :donation do
    recipient "some organization"
    value "12345"
    donation_time Date.today
  end

end

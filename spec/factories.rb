FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "john+#{n}@doe.com"
    end
    password "password1"
  end

  factory :diary_entry do
    lights_out DateTime.yesterday
    wakeup   DateTime.now
    notes "some notes"
    rating 5
    association :user
  end
end

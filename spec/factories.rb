FactoryGirl.define do
  factory :user do
    full_name 'John Doe'
    admin false

    trait :admin do
      admin true
    end
  end

  factory :expense do
    sequence :name do |n|
      "Expense number #{n}"
    end

    approved false
    amount 12.14
  end
end

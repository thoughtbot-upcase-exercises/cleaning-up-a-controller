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

    amount 12.14

    trait :approved do
      approved true
    end

    trait :unapproved do
      approved false
    end
  end
end

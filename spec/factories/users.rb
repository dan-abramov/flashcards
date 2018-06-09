FactoryBot.define do
  factory :user do
    email 'test@test.com'
    password '12345'
    password_confirmation '12345'
    locale 'ru'
    current_block_id ''

    trait :with_block do
      after(:create) do |user|
        create(:block, user: user)
      end
    end

    trait :with_2_blocks do
      after(:create) do |user|
        create(:block, user: user)
        create(:block, user: user)
      end
    end

    trait :with_block_with_card do
      after(:create) do |user|
        create(:block, :with_card, user: user)
      end
    end

    trait :with_block_with_2_cards do
      after(:create) do |user|
        create(:block, :with_2_cards, user: user)
      end
    end

    factory :invalid_user do
      email 'почта@test.com'
      password '1'
      password_confirmation '1'
    end
  end
end

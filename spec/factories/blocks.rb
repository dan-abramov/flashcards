FactoryBot.define do
  factory :block do
    title 'Block 1'
    user

    trait :with_card do
      after(:create) do |block|
        create(:card, user: block.user, block: block)
      end
    end

    trait :with_2_cards do
      after(:create) do |block|
        create(:card, user: block.user, block: block)
        create(:card, user: block.user, block: block)
      end
    end
  end
end

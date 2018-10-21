FactoryBot.define do
  factory :email_view, class: 'ActionMailerPixel::EmailView' do
    association :recipient, factory: :user
    association :campaign, factory: :campaign

    trait :no_views do
      views { 0 }
    end
  end
end

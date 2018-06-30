FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user #{i}" }
    password 'password'

    token { SecureRandom.uuid }
  end
end

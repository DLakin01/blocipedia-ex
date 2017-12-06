FactoryBot.define do
  pw = RandomData.random_sentence

  factory :user do
    name RandomData.random_name
    email RandomData.random_email
    password pw
    password_confirmation pw
  end
end

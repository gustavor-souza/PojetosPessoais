RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do

  factory :user do
    name "teste teste"
    email "testeemail@teste.com"
    password "12345678"
  end

  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    comments_allowed false
    styles           "styles here"

    factory :unpublished_article do
      published false
    end

    factory :article_with_comments do
      ignore do
        comments_count 3
      end

      after(:create) do |article, evaluator|
        FactoryGirl.create_list(:comment, evaluator.comments_count, :article => article)
      end
    end
  end

  factory :ticket do
    title  "teste"
    description "teste teste teste description"
    system_id nil
    category_id nil
    status_id nil
    priority_id nil
    creator_id nil
    incharge_id nil
  end

  factory :comment do
    article
    email
    body { Forgery::LoremIpsum.sentence }
    full_name "Commenter Bob"
  end
end

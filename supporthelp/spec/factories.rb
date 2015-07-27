RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do

  factory :user do
    name "teste teste"
    email "testeemail@teste.com"
    phone "99988877"
    ddd "81"
    password "12345678"
  end

  factory :invalid_user_phone, class: :user do
    name "teste teste"
    email "testeemail2@teste.com"
    phone "9998887799999"
    ddd "81"
    password "12345678"
  end

  factory :invalid_user_ddd do
    name "teste teste"
    email "testeemail3@teste.com"
    phone "99988877"
    ddd "814"
    password "12345678"
  end

  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    comments_allowed false
    styles           "styles here"

    factory :unpublished_article do
      published false
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

  factory :ticket_search_pass1, class: :ticket do
    title  "teste passou"
    description "description"
    system_id nil
    category_id nil
    status_id nil
    priority_id nil
    creator_id nil
    incharge_id nil
  end

  factory :ticket_search_pass2, class: :ticket do
    title  "teste title"
    description "passou description"
    system_id nil
    category_id nil
    status_id nil
    priority_id nil
    creator_id nil
    incharge_id nil
  end

  factory :ticket_search_not_pass, class: :ticket do
    title  "ticket title"
    description "description"
    system_id nil
    category_id nil
    status_id nil
    priority_id nil
    creator_id nil
    incharge_id nil
  end

  factory :comment do
    content 'teste teste'
  end

  factory :category do
    description 'teste teste'
  end

  factory :company do
    name 'teste teste'
    cnpj '60746948000112'
  end

  factory :priority do
    description 'teste teste'
  end

  factory :status do
    description 'teste teste'
  end

  factory :system do
    description 'teste teste'
  end
end

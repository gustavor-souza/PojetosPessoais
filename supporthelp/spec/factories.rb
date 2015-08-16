RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do

  factory :user do
    name {FFaker::Name.name}
    email 'we@we.com'
    phone '99999999'
    ddd '81'
    password {FFaker::InternetSE.password}
  end

  factory :user_attendant, class: :user, aliases: [:incharge] do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    phone '99999999'
    ddd '81'
    password {FFaker::InternetSE.password}
    is_attendant true
  end

  factory :invalid_user_phone, class: :user do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    phone "9998887799999"
    ddd '81'
    password {FFaker::InternetSE.password}
  end

  factory :invalid_user_ddd do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    phone "99988877"
    ddd "814"
    password {FFaker::InternetSE.password}
  end

  factory :comment do
    content 'teste teste'
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

  factory :category do
    description 'teste teste'
    system
  end

  factory :ticket do
    title  "teste"
    description "teste teste teste description"
    system
    category
    status
    priority
  end

  factory :ticket_search_pass1, class: :ticket do
    title  "teste passou"
    description "description"
  end

  factory :ticket_search_pass2, class: :ticket do
    title  "teste title"
    description "passou description"
  end

  factory :ticket_search_not_pass, class: :ticket do
    title  "ticket title"
    description "description"
  end
end

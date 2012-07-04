FactoryGirl.define do

  factory :notification do
    user
    association :resource, :factory => :resource
  end
  
  factory :resource do
    text "Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac."
  end
  
  factory :user do
    first_name "Charles"
    last_name "Barrett"
    sequence(:email) {|n| "user#{n}@email.com"}
    password "password"
  end

end
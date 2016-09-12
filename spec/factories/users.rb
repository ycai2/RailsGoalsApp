FactoryGirl.define do
  factory :user do
    username "alex"
    password "a_very_secure_password"
    session_token "secure_session_token"
  end
end

FactoryGirl.define do
  factory :goal do
    title "MyString"
    author_id 1
    completed false
    private false
    details "MyText"
  end
end

FactoryGirl.define do
  factory :account do |a|
    a.name "Test Account"
    a.balance 0
  end

  factory :category do |c|
    c.name "Test Category"
    c.balance 0
  end

  factory :transaction do |t|
    t.value 100
    t.entity "Telephone company"
    t.expense true
  end
end

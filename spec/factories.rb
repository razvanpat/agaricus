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
    t.date Time.new
  end

  factory :budget do |b|
    b.value 100
    @time = Time.new
    b.month @time.month 
    b.year @time.year
  end

  factory :user do |u|
    u.email "foo@bar.com"
    u.password "12345678"
  end
end

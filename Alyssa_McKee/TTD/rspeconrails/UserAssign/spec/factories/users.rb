FactoryGirl.define do
  factory :user do
	name "Midoriya Izuku"
    email "Deku@almightfanclub.com"
    password "password"
    password_confirmation "password"
	
	trait :female do
		name "Uraraka"
		email "Uraraka@yuuei.com"
	end
    
  end
end

FactoryBot.define do
  factory :search do
    ip_address { '127.0.0.1' }
    term { 'hello' }
  end
end

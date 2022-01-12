FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(days: 23) }
    end_date { Faker::Date.backward(days: 14) }
    time { Faker::Time.backward(days: 5, period: :morning, format: :short) }
    address { Faker::Address.full_address  }
    theme { Faker::Quote.robin }
    details { Faker::Quote.jack_handey }
    image_data { 'xyz' }
    event_type { 'paid' }
    status { 'active' }
  end
end
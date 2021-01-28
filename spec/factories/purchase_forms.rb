FactoryBot.define do
  factory :purchase_form do
    postal_code           {'123-4567'}
    prefectures_id        {12}
    municipality          {'福岡市'}
    address               {'東区1-1'}
    building_name         {'福井ビル'}
    phone_number          {'09012345678'}
    token                 {"tok_abcdefghijk00000000000000000"}
  end
end

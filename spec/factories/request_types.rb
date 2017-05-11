FactoryGirl.define do
  factory :request_type do
    sequence   :name do |n| 'Search Type' end
  end
end

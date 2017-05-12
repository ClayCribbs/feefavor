FactoryGirl.define do
  factory :request_type do
    sequence   :name do |n| "RequestType ##{n}" end
  end
end

class Request < ApplicationRecord
  belongs_to :request_type
  belongs_to :requestor
  belongs_to :courthouse

  accepts_nested_attributes_for :courthouse
end

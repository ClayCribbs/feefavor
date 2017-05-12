class Courthouse < ApplicationRecord
  belongs_to :address

  has_many :requests

  accepts_nested_attributes_for :address
end

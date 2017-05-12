class RequestType < ApplicationRecord
  has_many :fields, class_name: 'RequestTypeField', dependent: :delete_all

  accepts_nested_attributes_for :fields, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end

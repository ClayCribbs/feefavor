class DocumentSearchType < ApplicationRecord
  has_many :fields, class_name: "DocumentSearchTypeField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end

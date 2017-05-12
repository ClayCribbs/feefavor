require 'rails_helper'

RSpec.describe RequestType, type: :model do
  describe '#validations' do
    it 'is valid if required fields are present' do
      request_type = build(:request_type)
      expect(request_type).to be_valid
      expect(request_type.errors).to be_empty
    end

    [ #required field
      :name,
    ].each do |required_field|
      it "is invalid if #{required_field} is not present" do
        request_type = build(:request_type)
        request_type.send("#{required_field}=", '')
        expect(request_type).not_to be_valid
        expect(request_type.errors).to have_key(required_field)
      end

      it "is invalid if #{required_field} is set to nil" do
        request_type = build(:request_type)
        request_type.send("#{required_field}=", nil)
        expect(request_type).not_to be_valid
        expect(request_type.errors).to have_key(required_field)
      end
    end

    [   #unique field     #value
      [ :name,           'unique_request_type_name'  ],
    ].each do |test_case|
      unique_field, value = test_case

      it "is invalid if #{unique_field} is not unique" do
        request_type_1 = build(:request_type)
        request_type_1.send("#{unique_field}=", value)
        request_type_1.save

        request_type_2 = build(:request_type)
        request_type_2.send("#{unique_field}=", request_type_1.send(unique_field))

        expect(request_type_2).not_to be_valid
        expect(request_type_2.errors).to have_key(unique_field)
      end
    end
  end
end

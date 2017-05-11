class CreateRequestTypeFields < ActiveRecord::Migration[5.0]
  def change
    create_table :request_type_fields do |t|
      t.string     :name
      t.string     :field_type
      t.boolean    :required
      t.belongs_to :request_type, foreign_key: true

      t.timestamps
    end
  end
end

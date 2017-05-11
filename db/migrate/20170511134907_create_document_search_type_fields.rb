class CreateDocumentSearchTypeFields < ActiveRecord::Migration[5.0]
  def change
    create_table :document_search_type_fields do |t|
      t.string     :name
      t.string     :field_type
      t.boolean    :required
      t.belongs_to :document_search_type, foreign_key: true

      t.timestamps
    end
  end
end

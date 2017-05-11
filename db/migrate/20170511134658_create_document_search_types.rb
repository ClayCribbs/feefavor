class CreateDocumentSearchTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :document_search_types do |t|
      t.string :name

      t.timestamps
    end
  end
end

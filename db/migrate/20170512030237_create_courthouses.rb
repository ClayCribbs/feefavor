class CreateCourthouses < ActiveRecord::Migration[5.0]
  def change
    create_table :courthouses do |t|
      t.string     :name
      t.string     :county
      t.belongs_to :address, foreign_key: true

      t.timestamps
    end
  end
end

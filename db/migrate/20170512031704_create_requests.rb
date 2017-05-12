class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :request_type, foreign_key: true
      t.references :requestor, index: true, foreign_key: { to_table: :users }
      t.references :courthouse, foreign_key: true
      t.datetime   :deadline_at
      t.string     :slug

      t.timestamps
    end
  end
end

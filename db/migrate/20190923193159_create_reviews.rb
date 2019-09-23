class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text "body"
      t.bigint "idea_id"
      t.bigint "user_id"
      t.timestamps
    end
  end
end

class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id, index: true
      t.string :content
      t.string :img

      t.timestamps null: false
    end
  end
end

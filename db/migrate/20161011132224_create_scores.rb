class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.string :username
      t.integer :text_id
      t.integer :wpm
      t.float :time
      t.float :accuracy

      t.timestamps
    end
  end
end

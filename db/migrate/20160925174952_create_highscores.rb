class CreateHighscores < ActiveRecord::Migration[5.0]
  def change
    create_table :highscores do |t|
      t.string :username
      t.integer :wpm
      t.decimal :accuracy

      t.timestamps
    end
  end
end

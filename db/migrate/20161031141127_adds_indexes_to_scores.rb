class AddsIndexesToScores < ActiveRecord::Migration[5.0]
  def change
    add_index :scores, :text_id
    add_index :scores, [:text_id, :wpm]
  end
end

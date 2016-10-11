class Score < ApplicationRecord
  validates :username, presence: true
  validates :text_id, presence: true
  validates :wpm, presence: true
  validates :time, presence: true
  validates :accuracy, presence: true
end

class Score < ApplicationRecord
  validates :username, presence: true,
                       length: { in: 1..40 }
  validates :text_id, presence: true
  validates :wpm, presence: true
  validates :time, presence: true
  validates :accuracy, presence: true

  def position
    Score.where("text_id = #{self.text_id} AND wpm > #{self.wpm}").count + 1
  end
end

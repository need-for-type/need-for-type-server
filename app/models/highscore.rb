class Highscore < ApplicationRecord

  validates :username, presence: true
  validates :wpm, presence: true
  validates :accuracy, presence: true

  def self.get_top(limit, username = nil)
    highscores = Highscore.find(:all, order: 'wpm desc', limit: limit)
  end

  def self.get_above_me_count(username)
    user = Highscore.find_by_username(username)
    Highscore.count(conditions: ['wpm > ?', user.wpm])
  end
end

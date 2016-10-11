class HighscoreSerializer < ActiveModel::Serializer
  attributes :id, :username, :wpm, :accuracy
end

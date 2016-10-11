class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :username, :text_id, :wpm, :time, :accuracy, :created_at, :updated_at
end

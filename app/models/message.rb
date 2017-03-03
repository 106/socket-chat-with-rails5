class Message < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  before_save :translate_to_dialect

  delegate :dialect, to: :user

  def translate_to_dialect
    self.body = Translator::Degraeve.new(body, dialect.name).translate!
  end
end

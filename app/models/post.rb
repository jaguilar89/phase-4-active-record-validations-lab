class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  def title_is_clickbait
    words = ["Won't Believe", "Secret", "Top", "Guess"]

    match = words.any? do |word|
      title.to_s.include?(word)
    end

    unless match
      errors.add(:title, "Title not allowed!")
    end
  end
end

=begin
    1. Title must contain the selected words
    2. Add a validation error if the title does not contain ALL of those words.
=end

class Recipe < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, inclusion: { in: ["Brussels sprouts"]}
  validates :servings, numericality: { greater_than_or_equal_to: 1}
end
# Does not save any validations greater than 1, either.
# validates :servings, numericality: { greater_than_or_equal_to: 1}

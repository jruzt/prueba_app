class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  has_many :cart_lines, dependent: :destroy

end

class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :books, through: :subjects
  validates :duration, presence: true, inclusion: { in: (1..30), message: "cannot be less than 1 day or more than 30 days." }
  validates :name, presence: true, uniqueness: true

end
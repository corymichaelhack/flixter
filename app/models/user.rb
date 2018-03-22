class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def enrolled_in(course)
   # Version 1 code 
    # enrolled_courses = []
    # enrollments.each do |enrollment|
    #   enrolled_courses << enrollment.course

   # Version 2 refactored code
    # enrolled_courses = enrollments.collect(&:course)
    # return enrolled_courses.include?(course)

   # Version 3 refactored code 
     return enrolled_courses.include?(course) 
    end
end

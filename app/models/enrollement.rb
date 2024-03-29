class Enrollement < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, :course, presence: true
  validates_uniqueness_of :user_id, scope: :course_id #user cant be subscribed to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id #course cant be subscribed to the same user twice

  validate :cant_subscribe_to_own_course #user can't create a subscriptionif course.user == current_user
  
  def to_s
    user.to_s +" " + course.to_s
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

  protected
  def cant_subscribe_to_own_course
    if self.new_record?
      if self.user_id.present?
        if user_id == course.user_id
          errors.add(:base, "You can not subscribe to your own course")
        end
      end
    end
  end

  

end

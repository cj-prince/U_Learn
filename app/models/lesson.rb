class Lesson < ApplicationRecord
  belongs_to :course
  validates :title, :content, :course, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end

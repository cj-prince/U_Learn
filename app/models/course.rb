class Course < ApplicationRecord
    validates :title, :short_description, :language, :price, :level,  presence: true
    validates :description, presence: true, length: { :minimum => 5 }

    belongs_to :user
    has_many :lessons, dependent: :destroy
    has_many :enrollements
    def to_s
        title
    end
    has_rich_text :description
    
    extend FriendlyId
        friendly_id :title, use: :slugged

    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }

    def bought(user)
        self.enrollements.where(user_id: [user.id], course_id: [self.id].empty?)
    end

end

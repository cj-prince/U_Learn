class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end

    private

    attr_reader :user, :scope
  end

  
  def edit?
    @user.has_role?:admin || @record.teacher = @teacher
  end
  def update?
    @user.has_role?:admin
  end

  def new?
    @user.has_role?:admin
  end

  def create?
    @user.has_role?:admin
  end

  def destroy?
    @user.has_role?:admin
  end

end

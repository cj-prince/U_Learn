class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end
    
    private

    attr_reader :user, :scope
  end
  
  def edit?
    @user.has_role?:admin
  end
  def update?
    @user.has_role?:admin
  end


end

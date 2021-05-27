class LessonPolicy < ApplicationPolicy
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


    def show?
        @user.has_role?(:admin) || @record.course.user_id ==user.id
    end
        
    end
    def edit?
    @user.has_role?:admin || @record.course.user_id == @user.id
    end
    def update?
    @user.has_role?:admin
    end

    def new?
    #@user.has_role?:admin
    end

    def create?
    #@user.has_role?:admin
    end

    def destroy?
    @user.has_role?:admin
    end


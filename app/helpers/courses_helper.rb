module CoursesHelper
    def enrollement_button(course)
        if current_user
            if course.user == current_user
                link_to "View analytics.", course_path(course)
            elsif course.enrollements.where(user: current_user).any?
                link_to "Keep learning already enrolled", course_path(course)
            elsif course.price > 0
                link_to number_to_currency(course.price), new_course_enrollement_path(course), class: "btn btn-md btn-success"
            else
                link_to "free", new_course_enrollement_path(course), class: "btn btn-md btn-success"
            end
            #logic to buy
        else
            link_to "check price", course_path(course), class: "btn btn-md btn-success"
        end
    end
end

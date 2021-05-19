User.create!(email: 'cj@gmail.com', password: 'ffffff', password_confirmation: 'ffffff')

30.times do
    Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::Suits.quote,
    user_id: User.first.id,
    }])
end
User.create!(email: 'cj@gmail.com', password: 'ffffff', password_confirmation: 'ffffff')

30.times do
    Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::Suits.quote,
    user_id: User.first.id,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 20000)
    }])
end
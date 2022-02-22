# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clearing Database'
Post.destroy_all
User.destroy_all
Comment.destroy_all
puts 'Done!!'

puts '❗️ seeding'


5.times do 
    User.create(username: Faker::Artist.name, password: "123")
end

10.times do 
    Post.create(title: Faker::Movie.title, content: "The box sat on the desk next to the computer. It had arrived earlier in the day and business had interrupted her opening it earlier. She didn't who had sent it and briefly wondered who it might have been. As she began to unwrap it, she had no idea that opening it would completely change her life.
        They had always called it the green river. It made sense. The river was green. The river likely had a different official name, but to everyone in town, it was and had always been the green river. So it was with great surprise that on this day the green river was a fluorescent pink.", likes: rand(20), user_id: rand(User.count))
end

20.times do 
    Comment.create(content: Faker::Lorem.sentences(number: rand(4)),post_id: rand(Post.count))
end

puts 'seeding done !!!'


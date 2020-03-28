# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: 'shwetakale13@gmail.com', role: 'Admin')
user.password = 'shweta123'
user.save

movie1 = Movie.create( name: 'Star Wars', description: 'Star Wars is an American epic space-opera media franchise created by George Lucas, which began with the eponymous 1977 film and quickly became a worldwide pop-culture phenomenon.', duration: 120, release_date: Date.today - 10.days, language: 'English' )

movie2 = Movie.create(name: 'Lord of the Rings', description: 'DescriptionA young hobbit, Frodo, who has found the One Ring that belongs to the Dark Lord Sauron, begins his journey with eight companions to Mount Doom, the only place where it can be destroyed.', duration: 130, release_date: Date.today - 2.days, language: 'English' )

movie3 = Movie.create(name: 'Uri: The Surgical Strike', description: 'DescriptionMajor Vihaan Singh Shergill of the Indian Army leads a covert operation against a group of militants who attacked a base in Uri, Kashmir, in 2016 and killed many soldiers.', duration: 120, release_date: Date.today - 10.days, language: 'Hindi' )

movie4 = Movie.create( name: '3 Ediots', description: 'DescriptionIn college, Farhan and Raju form a great bond with Rancho due to his refreshing outlook. Years later, a bet gives them a chance to look for their long-lost friend whose existence seems rather elusive.', duration: 110, release_date: Date.today - 3.days, language: 'Hindi' )

movie5 = Movie.create(name: 'Swades', description: 'DescriptionMohan, an Indian expatriate employed with NASA, travels to his country to track down his beloved nanny, Kaveri. During his stay, he finds himself advocating for reform in a village.', duration: 120, release_date: Date.today - 10.days, language: 'English' )

movie6 = Movie.create(name: 'Laggan', description: 'DescriptionDuring the British Raj, a farmer named Bhuvan accepts the challenge of Captain Andrew Russell to beat his team in a game of cricket and enable his village to not pay taxes for the next three years.', duration: 120, release_date: Date.today - 10.days, language: 'English')

screen1 = Screen.create(name: 'A')
screen2 = Screen.create(name: 'B')
screen3 = Screen.create(name: 'C')

slot1 = Slot.create(start_time: 12, end_time: 3)
slot2 = Slot.create(start_time: 3, end_time: 6)
slot3 = Slot.create(start_time: 6, end_time: 9)
slot4 = Slot.create(start_time: 9, end_time: 12)

movie_screen = MovieScreen.create(screen: screen1, movie: movie1, slot: slot1, date: Date.today)
movie_screen = MovieScreen.create(screen: screen2, movie: movie1, slot: slot2, date: Date.today)
movie_screen = MovieScreen.create(screen: screen2, movie: movie1, slot: slot3, date: Date.today)
movie_screen = MovieScreen.create(screen: screen3, movie: movie1, slot: slot4, date: Date.today)
movie_screen = MovieScreen.create(screen: screen2, movie: movie1, slot: slot1, date: Date.today + 1.day)
movie_screen = MovieScreen.create(screen: screen2, movie: movie2, slot: slot3, date: Date.today + 1.day)
movie_screen = MovieScreen.create(screen: screen3, movie: movie3, slot: slot1, date: Date.today + 1.day)
movie_screen = MovieScreen.create(screen: screen3, movie: movie2, slot: slot4, date: Date.today + 1.day)

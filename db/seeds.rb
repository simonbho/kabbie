User.destroy_all
      user_list = [ { :first_name => "Simon",
                      :last_name => "Ho",
                      :email => 'sho2015@kellogg.northwestern.edu',
                      :phone => 3125552121,
                      :password => 'ilovecodes',
                    },
                    { :first_name => "Jamie",
                      :last_name => "Ward",
                      :email => 'jward2015@kellogg.northwestern.edu',
                      :phone => 8475551234,
                      :password => 'iloveruby',
                    },
                    { :first_name => "Jeff",
                      :last_name => "Cohen",
                      :email => 'j-cohen@kellogg.northwestern.edu',
                      :phone => 3123849292,
                      :password => 'hockey',
                    },
                    { :first_name => "Brian",
                      :last_name => "Eng",
                      :email => 'b-eng@kellogg.northwestern.edu',
                      :phone => 8475559876,
                      :password => 'baseball',
                    },
                  ]

user_list.each do |user_info|
  u = User.new
  u.first_name = user_info[:first_name]
  u.last_name = user_info[:last_name]
  u.email = user_info[:email]
  u.phone = user_info[:phone]
  u.password = user_info[:password]
  u.save
end

puts "There are now #{User.count} users in the database."

Location.destroy_all
["Evanston", "Chicago", "O'Hare", "Midway"].each do |location_name|
  l = Location.new
  l.name = location_name
  l.save
end

puts "There are now #{Location.count} locations in the database."

Ride.destroy_all
      ride_list = [ { :origin => Location.first.name,
                      :destination => Location.last.name,
                      :depart_date => DateTime.new(2014,5,15),
                      :depart_time_1 => "11:00 PM",
                      :depart_time_2 => "11:30 PM",
                      :comments => "need to leave by 11:30pm at the absolute latest",
                    },
                    { :origin => Location.first.name,
                      :destination => Location.last.name,
                      :depart_date => "2014-05-15",
                      :depart_time_1 => "10:00 PM",
                      :depart_time_2 => "10:30 PM",
                      :comments => "let's take Uber",
                    },
                    { :origin => Location.first.name,
                      :destination => Location.last.name,
                      :depart_date => "2014-05-25",
                      :depart_time_1 => "10:00 AM",
                      :depart_time_2 => "12:00 PM",
                      :comments => "flexible but would like to leave closer to 10:00am",
                    },
                    { :origin => Location.last.name,
                      :destination => Location.first.name,
                      :depart_date => "2014-05-10",
                      :depart_time_1 => "09:00 AM",
                      :depart_time_2 => "10:00 AM",
                      :comments => "heading to an interview",
                    },
                    { :origin => Location.last.name,
                      :destination => Location.first.name,
                      :depart_date => "2014-06-01",
                      :depart_time_1 => "08:00 PM",
                      :depart_time_2 => "09:00 PM",
                      :comments => "need to wait for bags, meet up at baggage carousel",
                    },
                  ]

ride_list.each do |ride_info|
  r = Ride.new
  r.origin = ride_info[:origin]
  r.destination = ride_info[:destination]
  r.depart_date = ride_info[:depart_date]
  r.depart_time_1 = ride_info[:depart_time_1]
  r.depart_time_2 = ride_info[:depart_time_2]
  r.comments = ride_info[:comments]
  r.save
end

puts "There are now #{Ride.count} rides in the database."

Match.destroy_all
      match_list = [{:user_id => User.find_by(:email => 'sho2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(0).first.id,
                    },
                    {:user_id => User.find_by(:email => 'jward2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(0).first.id,
                    },
                    {:user_id => User.find_by(:email => 'j-cohen@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(0).first.id,
                    },
                    {:user_id => User.find_by(:email => 'b-eng@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(1).first.id,
                    },
                    {:user_id => User.find_by(:email => 'b-eng@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(2).first.id,
                    },
                    {:user_id => User.find_by(:email => 'sho2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(2).first.id,
                    },
                    {:user_id => User.find_by(:email => 'j-cohen@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(3).first.id,
                    },
                    {:user_id => User.find_by(:email => 'jward2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(3).first.id,
                    },
                    {:user_id => User.find_by(:email => 'sho2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(4).first.id,
                    },
                    {:user_id => User.find_by(:email => 'jward2015@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(4).first.id,
                    },
                    {:user_id => User.find_by(:email => 'j-cohen@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(4).first.id,
                    },
                    {:user_id => User.find_by(:email => 'b-eng@kellogg.northwestern.edu').id,
                      :ride_id => Ride.offset(4).first.id,
                    },
                  ]



match_list.each do |match_info|
  m = Match.new
  m.user_id = match_info[:user_id]
  m.ride_id = match_info[:ride_id]
  m.save
end

puts "There are now #{Match.count} matches in the database."

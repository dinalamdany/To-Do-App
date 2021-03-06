namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_lists
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_lists
  5.times do
    User.all.each do |user|
      user.lists.create!(:name => Faker::Name.name)
    end
  end
end

require 'faker'

namespace :db do
  desc "Peupler la base de donnees"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create(:nom => "Utilisateur exemple",
                 :email => "example@railstutorial.org",
                 :password => "1234",
                 :password_confirmation => "1234")
    99.times do |n|
      nom  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "1234"
      User.create!(:nom => nom,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    puts User.find_by_email(email).nom
    end
  end
end
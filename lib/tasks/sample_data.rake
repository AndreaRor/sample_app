
namespace :db do
  desc "Peupler la base de donnees"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke
    User.create(:nom => "Andrea",
                 :address => "Rue de la Brique 6 1400 Nivelles Belgique",
                 :email => "a@h.com",
                 :password => "1234",
                 :password_confirmation => "1234")
    admin =User.create(:nom => "Admin",
                       :address => "Rue de la Brique 6 1400 Nivelles Belgique",
                       :email => "admin@h.com",
                       :password => "1234",
                       :password_confirmation => "1234")
    admin.toggle!(:admin)
    
    99.times do |n|
      nom  = Faker::Name.name
      address = "Rue de la Brique 6 1400 Nivelles Belgique"
      email = "example-#{n+1}@railstutorial.org"
      password  = "1234"
      User.create!(:nom => nom,
                   :address => address,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
      puts User.find_by_email(email).nom
    end

      Categorie.create(:nom => "Voiture")
      Categorie.create(:nom => "Cuisine")
      Categorie.create(:nom => "Culture")
      Categorie.create(:nom => "Actualite")
      Categorie.create(:nom => "Sport")
      Categorie.create(:nom => "Poney")


    User.all(:limit => 50).each do |user|
      10.times do 
        @post = user.microposts.create!(:content => Faker::Lorem.sentence(5), :categorie_id => Random.rand(1..6).to_i)
        puts "Post : #{@post.content} | cat : #{Categorie.find(@post.categorie_id).nom}"
      end
    end

      users = User.all
      user  = users.first
      following = users[1..50]
      followers = users[3..40]
      following.each { |followed| user.follow!(followed) }
      followers.each { |follower| follower.follow!(user) }


  end
end
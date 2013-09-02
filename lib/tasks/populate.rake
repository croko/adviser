namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    # Run db:seed task
    Rake::Task['db:seed'].invoke

    50.times do |i|
      Doctor.create do |doctor|
        doctor.last_name = Faker::Name.last_name
        doctor.first_name = Faker::Name.first_name
        doctor.rating = %w(4.1 5 3.4 4.4 3.1 3.5 4.7).sample
        doctor.description = Faker::Lorem.paragraph(3)
        doctor.education = Faker::Lorem.sentence(2)
        doctor.starting_work = Date.today - 10.years
        doctor.high_school_name = Faker::Lorem.sentence(3)
        doctor.high_school_finished = Date.today - 10.years
        doctor.awards = Faker::Lorem.sentence(5)
        doctor.visit_home = %w(true false).sample
        doctor.price = %w(20.0 23.0 25.0 30.0 50.0 100.0 200.0).sample

        address = Address.new(
            email: "v#{i}@doctor.®m",
            address_1: Faker::Address.street_name,
            city: Faker::Address.city,
            district: Faker::Address.state_abbr,
            state: Faker::Address.state,
            zip_code: Faker::Address.zip_code,
            phone_number: Faker::PhoneNumber.phone_number,
            mobile_phone_number: Faker::PhoneNumber.cell_phone,
            website_url: Faker::Internet.url
        )
        doctor.addresses << address
        doctor.categories << Category.all.sample
        doctor.specialty = doctor.categories.first.name
      end
    end
    Doctor.all.each do |doctor|
      photo = doctor.photos.new
      photo.image = File.open(Dir.glob(File.join(Rails.root, 'spec/factories/sampleimages', '*')).sample)
      photo.save
    end

    20.times do |i|
      Clinic.create do |clinic|
        clinic.full_name = Faker::Company.name
        clinic.rating = %w(4.1 5 3.4 4.4 3.1 3.5 4.7).sample
        clinic.description = Faker::Lorem.paragraph(3)
        clinic.starting_work = Date.today - 10.years
        clinic.awards = Faker::Lorem.sentence(5)
        clinic.visit_home = %w(true false).sample
        clinic.price = %w(20.0 23.0 25.0 30.0 50.0 100.0 200.0).sample

        address = Address.new(
            email: "v#{i}@clinic.com",
            address_1: Faker::Address.street_name,
            city: Faker::Address.city,
            district: Faker::Address.state_abbr,
            state: Faker::Address.state,
            zip_code: Faker::Address.zip_code,
            phone_number: Faker::PhoneNumber.phone_number,
            mobile_phone_number: Faker::PhoneNumber.cell_phone,
            website_url: Faker::Internet.url
        )
        clinic.addresses << address
        clinic.categories << Category.all.sample
        clinic.specialty = clinic.categories.first.name
      end
    end
    Clinic.all.each do |clinic|
      photo = clinic.photos.new
      photo.image = File.open(Dir.glob(File.join(Rails.root, 'spec/factories/sampleimages', '*')).sample)
      photo.save
    end
  end
end
namespace :dev do
  desc "Genrate dummy data"
  task prime: :environment do

    chapters = []
    1000.times do
      chapter = { 
        title: Faker::Book.title,
        content: LiterateRandomizer.paragraphs,
        created_at: Time.now,
        updated_at: Time.now
      }
      chapters.push chapter
      print "."
    end
    Chapter.insert_all(chapters)
  end

end

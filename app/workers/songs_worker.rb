class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file_path)
    CSV.foreach(file_path, headers: true) do |song|
      binding.pry
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end

#to start, in the terminal
#`redis-server`
# `bundle exec sidekiq` (in the different tab)
# `rails s` (in the different tab)

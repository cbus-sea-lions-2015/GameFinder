class UsersFetcher
  include Sidekiq::Worker

  def perform(bgg_username)
    library = Library.find_or_create_by(bgg_username)
    bgg_user_library = BggApi.new.collection({ username: bgg_username })

    collection_array = bgg_user_library["item"].map { |game| game["objectid"].to_i }

    LibrariesFetcher(collection_array, library.id)
  end
end

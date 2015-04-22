class UsersFetcher
  include Sidekiq::Worker

  def perform(bgg_username,library_id = nil)
    library = Library.find_by(id: library_id) if library_id
    bgg_user_library = BggApi.new.collection({ username: bgg_username })
    existing_games_array = []
    existing_games_array += library.games.map { |game| game.bgg_id } if library
    collection_array = bgg_user_library["item"].map { |game| game["objectid"].to_i }
    collection_array -= existing_games_array
    LibrariesFetcher.perform_async(collection_array, library_id)
  end
end

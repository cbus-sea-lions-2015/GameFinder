class UsersFetcher
  include Sidekiq::Worker

  def perform(bgg_username)
    library = Library.find_or_create_by(bgg_username: bgg_username)
    bgg_user_library = BggApi.new.collection({ username: bgg_username })

    existing_games_array = library.games.map { |game| game.bgg_id }
    collection_array = bgg_user_library["item"].map { |game| game["objectid"].to_i }
    collection_array -= existing_games_array
    LibrariesFetcher.perform_async(collection_array, library.id)
  end
end

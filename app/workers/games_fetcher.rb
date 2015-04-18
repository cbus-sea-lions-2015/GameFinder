class GamesFetcher
  include Sidekiq::Worker

  def perform(game_ids, library_id)
    game_json = BggApi.new.thing({ id: game_ids.join(",") })

    BggParser.games_parse(game_json, library_id)
  end
end

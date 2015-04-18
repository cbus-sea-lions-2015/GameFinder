class LibrariesFetcher
  include Sidekiq::Worker

  def perform(game_ids, library_id)
    game_ids.each_slice(5) do |slice|
      GamesFetcher.perform_async(slice, library_id)
    end
  end
end

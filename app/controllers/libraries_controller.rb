class LibrariesController < SecuredController
  def show
    all_games = Library.find_by(bgg_username: params[:id]).games
    # UsersFetcher.perform_async(params[:id])
    render json: all_games.to_json
  end
end

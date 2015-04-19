class LibrariesController < SecuredController
  def index
    all_libraries = Library.all
    render json: all_libraries.to_json
  end

  def show
    all_games = Library.find_by(bgg_username: params[:id]).games
    render json: all_games.to_json
  end

  def create
    bgg_user = params[:bgg_username]
    response = BggApi.new.collection({ username: bgg_user })
    if response.keys[0] != "error"
      UsersFetcher.perform_async(bgg_user)
      message = "This library is currently being imported. This typically takes moments to complete, however larger libraries may take 15-30 minutes to populate."
    else
      message = "That library does not exist."
    end
    render json: message.to_json
  end
end

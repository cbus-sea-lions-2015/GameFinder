class LibrariesController < SecuredController
  def index
    all_libraries = Library.all
    render json: all_libraries.to_json
  end

  def show
    all_games = Library.find_by(bgg_username: params[:id]).games.includes(:categories,:mechanics)

    json_games = all_games.map do |game|
      JSON::parse(game.to_json).merge({
        "mechanics"=> game.mechanics.map(&:name),
        "categories"=> game.categories.map(&:name),
      })
    end

    render json: json_games.to_json
  end

  def create
    user = User.find_by(auth0_id: params['token'])
    bgg_user = params['bgg_username']
    response = BggApi.new.collection({ username: bgg_user })
    if response.keys[0] != "error"
      library = Library.find_or_create_by(bgg_username: bgg_user)
      UsersFetcher.perform_async(bgg_user,library.id)
      user.library_id = library.id
      user.save
      message = 1
    else
      message = 0
    end
    render json: message.to_json
  end
end

class MechanicsController < SecuredController
  def index
    all_mechanics = Mechanic.all
    render json: all_mechanics.to_json
  end
end

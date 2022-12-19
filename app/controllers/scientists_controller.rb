class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    def index
        scientists = Scientist.all 
        render json: scientists, except: [:created_at, :updated_at]
    end

    def show
        scientist = Scientist.find(params[:id])
        #render json: scientist, include: :planets
        render json: scientist, serializer: ScientistAndPlanetsSerializer
      end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        scientist = Scientist.find(params:[:id])
        scientist = scientist.update(scientist_params)
        render json: scientist, status: :accepted
    end

    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy 
        head :no_content
    end



private

def scientist_params
    params.permit(:name, :field_of_study, :avatar)
end


# def not_found(err)
#     render json: { error: err.message }, status: :not_found
# end


def not_found
    render json: { error: "Scientist not found"}, status: :not_found
    #render json: {error: "#{exception.model} not found"}, status: :not_found
end

def unprocessable_entity(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
end

end

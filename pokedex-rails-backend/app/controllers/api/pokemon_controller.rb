class Api::PokemonController < ApplicationController

    def types
        render json: Pokemon::TYPES
    end
end

json.array! @pokemons.each do |pokemon|
  json.extract! pokemon, :id, :number, :name, :captured

  if pokemon.captured 
    json.image_url pokemon.image_url
  else
    json.image_url "/images/unknown.png"
  end
end
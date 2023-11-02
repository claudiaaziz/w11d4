# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
  TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
  ].sort.freeze

  validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }
  validates :name, :number, :attack, :defense, :poke_type, :image_url, presence: true
  validates :captured, inclusion: [true, false]
  validates :name, length: { in: 3..255 }, uniqueness: { message: "'%{value}' is already in use" }
  validates :number, uniqueness: true, numericality: {greater_than_or_equal_to: 1}
  validates :attack, numericality: {only_integer: true}, inclusion: 0..100
  validates :defense, numericality: {only_integer: true}, inclusion: 0..100

  has_many :items, dependent: :destroy
  has_many :poke_moves, dependent: :destroy
  has_many :moves, through: :poke_moves, source: :move
  
end

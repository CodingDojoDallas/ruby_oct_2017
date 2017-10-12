class Ingredient < ActiveRecord::Base
	has_many :ingredient_lists
	has_many :recipes, through: :ingredient_lists

end

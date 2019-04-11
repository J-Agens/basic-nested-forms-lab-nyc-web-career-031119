class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def recipe_ingredients=(ingredients)
    ingredients.each do |ingredient|
      ingredient = Ingredient.find_or_create_by(name: ingredient)
      self.ingredients << ingredient
    end
  end

  def recipe_ingredients
    self.ingredients.map do |ingredient|
      ingredient.name
    end
  end


end

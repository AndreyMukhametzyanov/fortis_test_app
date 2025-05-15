# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @chef = Chef.find(params[:chef_id])
    @recipes = @chef.recipes
  end

  def show; end

  def new
    @chef = Chef.find(params[:chef_id])
    @recipe = @chef.recipes.build
  end

  def create
    @chef = Chef.find(params[:chef_id])
    @recipe = @chef.recipes.build(recipe_params)

    if @recipe.save
      redirect_to chef_path(@recipe.chef), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @chef = @recipe.chef
  end

  def update
    @chef = @recipe.chef

    if @recipe.update(recipe_params)
      redirect_to chef_path(@recipe.chef), notice: 'Recipe was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to chef_path(@recipe.chef), notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :chef_id)
  end
end

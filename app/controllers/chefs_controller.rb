# frozen_string_literal: true

class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show edit update destroy]

  def index
    @chefs = if params[:query].present?
               Chef.where('name ILIKE ?', "%#{params[:query]}%")
             else
               Chef.all
             end

    respond_to do |format|
      format.html
      format.json { render json: { chefs: @chefs.as_json(only: %i[id name bio]) } }
    end
  end

  def show
    @recipes = @chef.recipes
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      redirect_to @chef, notice: 'Chef was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @chef.update(chef_params)
      redirect_to chefs_path, notice: 'Chef was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chef.destroy
    redirect_to chefs_url, notice: 'Chef was successfully destroyed.'
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:name, :bio)
  end
end

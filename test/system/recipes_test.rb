# frozen_string_literal: true

require 'application_system_test_case'

class RecipesTest < ApplicationSystemTestCase
  setup do
    @recipe = recipes(:one)
  end

  test 'visiting the index' do
    visit recipes_url
    assert_selector 'h1', text: 'Recipes'
  end

  test 'should create recipe' do
    visit recipes_url
    click_on 'New recipe'

    fill_in 'Chef', with: @recipe.chef_id
    fill_in 'Ingredients', with: @recipe.ingredients
    fill_in 'Instructions', with: @recipe.instructions
    fill_in 'Name', with: @recipe.name
    click_on 'Create Recipe'

    assert_text 'Recipe was successfully created'
    click_on 'Back'
  end

  test 'should update Recipe' do
    visit recipe_url(@recipe)
    click_on 'Edit this recipe', match: :first

    fill_in 'Chef', with: @recipe.chef_id
    fill_in 'Ingredients', with: @recipe.ingredients
    fill_in 'Instructions', with: @recipe.instructions
    fill_in 'Name', with: @recipe.name
    click_on 'Update Recipe'

    assert_text 'Recipe was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Recipe' do
    visit recipe_url(@recipe)
    click_on 'Destroy this recipe', match: :first

    assert_text 'Recipe was successfully destroyed'
  end
end

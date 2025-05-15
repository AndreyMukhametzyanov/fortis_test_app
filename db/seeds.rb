# frozen_string_literal: true

puts 'Cleaning up database...'
Recipe.destroy_all
Chef.destroy_all

puts 'Seeding chefs and recipes...'
10.times do
  chef = Chef.create!(
    name: Faker::Name.name,
    bio: Faker::Food.description
  )

  2.times do
    chef.recipes.create!(
      name: Faker::Food.dish,
      ingredients: "#{Faker::Food.ingredient}, #{Faker::Food.ingredient}",
      instructions: Faker::Lorem.paragraph(sentence_count: 3)
    )
  end
end

puts 'Seeding done!'

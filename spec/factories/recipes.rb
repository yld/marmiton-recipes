# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { Faker::Lorem.sentence }
    ingredients { 'MyString' }
    image { 'MyString' }
    cook_time { 'MyString' }
    prep_time { 'MyString' }
    total_time { 'MyString' }
    author { 'MyString' }
    nb_comments { 1 }
    people_quantity { 1 }
    budget { 'MyString' }
    difficulty { 'MyString' }
    rate { 1 }
    author_tip { 'MyString' }
    tags { 'MyString' }
  end
end

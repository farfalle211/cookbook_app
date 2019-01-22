  json.id recipe.id
  json.title recipe.title
  json.chef recipe.chef
  json.ingredients recipe.ingredients_list
  json.directions recipe.directions_list
  json.prep_time recipe.friendly_prep_time
  json.image_url recipe.image_url
  json.created_at recipe.friendly_created_at



json.formatted do     #formatted is just a key. The block below is a nested hash. 
  json.ingredients recipe.ingredients_list
  json.directions recipe.directions_list
  json.prep_time recipe.friendly_prep_time
  json.created_at recipe.friendly_created_at
end

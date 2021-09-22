Product.destroy_all
20.times do 
Product.create([{
  title: Faker::Commerce.product_name[0..20],
  description: Faker::Lorem.sentence(word_count: 15),
  unit_amount: Faker::Commerce.price(range: 1000..10000.0, as_string: true),
  image_url: "https://ucarecdn.com/93d2f6b9-596c-46d1-be59-c8335d22bdd4/fancypants.jpeg",
}])
end

puts "#{Product.count} products"

FactoryBot.define do
  factory :product do
    title { "Fancy Pants" }
    description { "MC Hammer wears these fancy pants" }
    price { 3000 }
    image { "https://ucarecdn.com/93d2f6b9-596c-46d1-be59-c8335d22bdd4/fancypants.jpeg" }
  end
end

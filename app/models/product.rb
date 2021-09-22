class Product < ApplicationRecord

  # filter products by title
  def self.search(title)
    products = Product.all
    products = products.where(["lower(title) LIKE ?", "%#{title.downcase}%"]) if title.present?
    return products
  end

end

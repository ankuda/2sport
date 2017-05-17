module ProductsHelper
	def categories_for_product
		options_from_collection_for_select(@categories, :id, :title, @product.category_id)
	end
end

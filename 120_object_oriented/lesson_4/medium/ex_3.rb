class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

# changing attr_reader to attr_accessor will technically work, but it also exposes
# the variables making the public.  @quantity can now be changed outside of the update_quantity
# method and may give undesired results as it is no longer protected.

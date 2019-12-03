class ExportPdf
  #`include` instead of subclassing Prawn::Document
  # as advised by the official manual
  include Prawn::View

  def initialize(basket)
    @basket = basket
    content(@basket)
    Prawn::Document.generate("/home/lokesh/Downloads/prawn.pdf")
  end

  def content(basket)
    @basket = basket
    @basket.each do |bas|
      text "Invoice name : #{bas.name}"
      text "Created at : #{bas.created_at}"
      bas.order.each do |id|
        if id.include? "["
          id = id.tr("[", " ")
        elsif id.include? "]"
          id = id.tr("]", " ")
        end


      product = Productinfo.find(OrderItem.find(id).productinfo_id)
      branch = Branchinfo.find(product.branchinfo_id)
      store = Storeinfo.find(branch.storeinfo_id)
      text branch.branchname
      text branch.address
      text product.productname
        price = product.productprice.to_f
      text price.to_s
      end
    end

  end
end
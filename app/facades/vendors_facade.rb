class VendorsFacade

  def initialize
    @service = VendorService.new
  end

  def single_vendor(id)
    response = @service.single_vendor(id)
    data = [response[:data]]
    data.map do |d|
      Vendor.new(d)
    end
  end
end
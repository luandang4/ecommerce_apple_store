module OrdersHelper
  def option_for_address
    current_user.delivery_addresses.map do |item|
      item.address
    end
  end
end

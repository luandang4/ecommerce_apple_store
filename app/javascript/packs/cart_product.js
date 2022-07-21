$(document).ready(function(){
  $(document).on("click", ".btn-add-to-cart", function(){
    var product_id = $(this).attr("data-product-id");
    var quantity = $('.product-quatity').val();
    $.ajax({
      url: '/cart_items',
      method: 'POST',
      data: {
        quantity: quantity,
        product_id: product_id
      }
    });
  });

  $(document).on("change", ".cart-item-qty", function(){
    var quantity = $(this).val();
    var cart_item_id = $(this).attr("data-cart-item-id");
    var product_id = $(this).parent().find(".product-id").attr("data-product-id");
    $.ajax({
      url: '/cart_items/' + cart_item_id,
      method: 'PUT',
      data: {
        quantity: quantity,
        product_id: product_id
      }
    });
  });

  $(document).on('click', '.delete-cart-item', function() {
    var cart_item_id = $(this).parent().find(".cart-item-qty").attr("data-cart-item-id");
    $.ajax({
      url: '/cart_items/' + cart_item_id,
      method: 'DELETE'
    });
  });

});

// class CartItem {
//   destroy_cart_item(element) {
//     var cart_item_id = $(element).parent().find(".cart-item-qty").attr("data-cart-item-id");
//     $.ajax({
//       url: '/cart_items/' + cart_item_id,
//       method: 'DELETE'
//     });
//   }
// }

// export default CartItem;
// window.CartItem = new CartItem();

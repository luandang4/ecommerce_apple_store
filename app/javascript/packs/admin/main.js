$(document).ready(function(){
  $(document).on("click", ".delete-product", function(){
    var id = $(this).attr("data-product-id");
    $.ajax({
      url: '/admin/products/' + id,
      method: 'DELETE'
    });
  });

  $(document).on("click", ".delete-category", function(){
    var id = $(this).attr("data-category-id");
    $.ajax({
      url: '/admin/categories/' + id,
      method: 'DELETE'
    });
  });

  $(document).on("change", ".category-option", function(){
    var cate_id = $(this).val();
    $.ajax({
      url: '/admin/categories/',
      method: 'GET',
      data: {
        id: cate_id
      }
    });
  });



});

if($(".alert").show()) {
  setTimeout(function(){
    $(".alert").hide("3000")
  }, 2500);
}

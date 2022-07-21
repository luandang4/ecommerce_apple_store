$(document).ready(function(){
  $(document).on("click", ".category-name", function(){
    var category_id = $(this).attr("data-category-id");
    $.ajax({
      url: '/categories/' + category_id,
      method: 'GET',
      dataType: "script",
      data: {
        id: category_id
      }
    });
  });
});

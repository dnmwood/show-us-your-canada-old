$( document ).on('turbolinks:load', function() {

  $(document).on('click','.delete-entry-button', {}, function(){
    event.preventDefault();
    var id = $(this).attr('value')
    $.ajax({
      url: "/admin/destroy/" + id,
      method: "delete",
      dataType: "JSON",
      data: $(this).serialize()
    }).done(function(responseData){
      $("#admin-table").html(responseData.html)
    });
  });
})

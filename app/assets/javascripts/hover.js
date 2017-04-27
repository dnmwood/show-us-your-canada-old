$(document).on('turbolinks:load', function() {

  $(".all-images").on("click", function() {
    var link = $(this).data("link");
    console.log(link);
    window.location.href = link
  });

  $(".image-block").on("click", function() {
    var link = $(this).data("link");
    console.log(link);
    window.location.href = link
  });


});

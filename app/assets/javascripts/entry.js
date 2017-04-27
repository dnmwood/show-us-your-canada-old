$( document ).on('turbolinks:load', function() {

  // if (window.location.href.indexOf("entries") > -1) {
  //   $(".navbar-right").addClass("dark-nav");
  // }
$('.prettySocial').prettySocial();


  // showing image preview
        function readURL(input) {
          console.log("reading input");
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('#img_prev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          }
        }






if (window.location.href.indexOf("users") > -1 && $('.create-your-entry').length === 0 ) {
    // get the url of the entry image
    const URL = $('#entry_image img').attr('src');
    console.log(URL);
    // split the image url
    const FIRST = URL.substring(0, URL.indexOf("upload/"));
    const LAST = URL.split("upload/")[1];

    var newerUrl = ""

    $('.filter-button').on('click', function() {

      // get the name of the filter and add e_art: to it
      var filterName = 'e_art:' + $(this).data("filter") + '/';

      // add the filter to the middle of it
      var filtered = FIRST + "upload/w_300,g_south_west,x_20,y_50,l_MyCanada-01_copy_sc33qn/" + filterName + LAST

      var filtered_no_hashtag = FIRST + "upload/" + filterName + LAST

      // assign it to the image
      $('#entry_image img').attr('src', filtered_no_hashtag );

      // assign the newUrl to a variable that updates
      newUrl = $('#entry_image img').attr('src');
      console.log(newUrl);

      newerUrl = newUrl.split("dx3z90dgl/")[1];
      console.log(newerUrl);


      $('#hidden-filter-send').val(newUrl);
      $('#hidden-filter-no-hashtag').val(filtered_no_hashtag);


    });

  }

  $('#avatar-upload').bind('change', function(e) {

  //this.files[0].size gets the size of your file.
/*  if (this.files[0].size < 2000000) {
    e.preventDefault()
    alert("Your photo is not high enough quality, please upload an image larger then 2 megabytes.")
  }
  */
    $(".upload-label").empty();
    $(".upload-label").append("Upload Complete");
    alert("File succesfully uploaded!")


});


    var loading = $('#loadbar').hide();
    $(document)
    .ajaxStart(function () {
        loading.show();
    }).ajaxStop(function () {
    	loading.hide();
    });

    var count = 0

    $("label.btn").on('click',function () {
    	var choice = $(this).find('input:radio').val();
    	$('#loadbar').show();
    	$('#quiz').fadeOut();
      $('#quiz' + count).fadeOut();
      count += 1
    	setTimeout(function(){
           $( "#answer" ).html(  $(this).checking(choice) );
            $('#quiz' + count ).show();
            $('#loadbar').fadeOut();
            if (count == 1) {
              $('#qid').html("2")
              $('#question-text').html("What geological formation is the muskokas sitatued on?")
            } else if (count == 2) {
              $('#qid').html("3")
              $('#question-text').html("What kind of cloud is typically found above a mountain?")
            } else if (count == 3) {
              $('#qid').html("4")
              $('#question-text').html("What kind of fog is in Toronto right now!")
            } else if (count == 4) {
              $('#qid').html("5")
              $('#question-text').html("What kind of cloud creates lightning!")
            } else {
              $('#qid').html(":)")
              $('#question-text').html(" All done!")
            }
           /* something else */
    	}, 1500);
    });

    $ans = 'Five-lined Skink';
    $ans1 = 'The Canadian Shield'
    $ans2 = 'lenticular clouds'
    $ans3 = 'Advective fog'
    $ans4 = 'Cumulonimbus cloud'

    $.fn.checking = function(ck) {
        if (ck != $ans && ck != $ans1 && ck != $ans2 && ck != $ans3 && ck != $ans4)
            return 'INCORRECT';
        else
            return 'CORRECT';
    };

  // $('#update-user-submit').on('click',function(){
  //   $('.story-submit').trigger('click')
  // });
});

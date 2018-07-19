$(function() {
  $('.simple_form.edit_card.inside_card').hide();

  $('.cancel-image-edit-form').on('click', function(){
    $('#card_image').val('');
    $('input[name="card[image_flickr_url]"]').remove();
    $('input[name="id"]').remove();
    $('.simple_form.edit_card.inside_card').hide();
    $('.change-image-button').show();
  });

  $('.change-image-button').click(function() {
    var card_id = $(this).data('cardId');
    $('.change-image-button').hide();
    $('.simple_form.edit_card.inside_card').show();
  });

  $('#card_image').change(function(e) {
    var image = $('input[name="card[image]"]')[0];
    $('#image-of-card').empty();
    $('#image-of-card').append('<img src="" width="150">');
    readURL(image);
    $('input[name="card[image_flickr_url]"]').remove();
    $('input[name="id"]').remove();
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#image-of-card img').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    };
  };
});

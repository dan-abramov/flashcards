 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $('body').on('click', '.flickr_photo', function(){
    $('.flickr_photo').removeClass('flickr-photo-checked');
    $(this).addClass('flickr-photo-checked');

    if ($('.flickr-confirm-button')) {
      $('.flickr-confirm-button').attr('data-dismiss', 'modal').addClass('ready');
      $('.flickr-update-confirm-button').attr('data-dismiss', 'modal').addClass('ready').prop('disabled', false);
    };
  });

  $('body').on('click', '.flickr-update-confirm-button.ready', function(){
    var card_id = $('#image-of-card').data('cardId');
    $('#image-of-card').empty();
    $('#image-of-card').append('<img src="' + $('.flickr-photo-checked').attr('src') +'"width="150">');
    $('.simple_form.edit_card').append('<input id="token" name="card[image_flickr_url]" type="hidden" value="' + $('.flickr-photo-checked').attr('src') +'">');
    $('.simple_form.edit_card').append('<input id="token" name="id" type="hidden" value="' + card_id +'">');
    $('#card_image').val('');
  });

  $('body').on('click', '.flickr-confirm-button.ready', function(){
    $('#image-of-card').empty();
    $('#image-of-card').append('<img src="' + $('.flickr-photo-checked').attr('src') +'" width="150">');
    $('.form-group-image-picker').append('<input id="token" name="card[image_flickr_url]" type="hidden" value="' + $('.flickr-photo-checked').attr('src') +'">');
    $('#card_image').val('');
  });
});

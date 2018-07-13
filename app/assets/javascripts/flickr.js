 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $('body').on('click', '.flickr_photo', function(){
    $('.flickr_photo').removeClass('flickr-photo-checked');
    $(this).addClass('flickr-photo-checked');
    $('.flickr-confirm-button').attr('data-dismiss', 'modal').addClass('ready');
  });

  $('body').on('click', '.flickr-confirm-button.ready', function(){
    console.log($('.flickr-photo-checked').attr('src'));
    $('.form-group-image-picker').children('.image-picker').remove();
    $('.form-group-image-picker').append('<img class="flickr_photo" src="' + $('.flickr-photo-checked').attr('src') +'">');
    $('.form-group-image-picker').append('<input id="token" name="image_url" type="hidden" value="' + $('.flickr-photo-checked').attr('src') +'">');
  });

});

// $('.form-group-image-picker').append('<div class="image-picker"></div>');
// $('.image-picker').append('<div class="input file optional card_image"></div>');
// $('.input.file.optional.card_image').append('<label class="file optional" for="card_image">Изображение</label>');
//                                     .append('<input class="file optional" type="file" name="card[image]" id="card_image">');

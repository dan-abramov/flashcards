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
    $('#image-of-card').append('<img class="flickr_photo" src="' + $('.flickr-photo-checked').attr('src') +'"width="150" height="150">');
    $('.simple_form.edit_card').append('<input id="token" name="card[image_flickr_url]" type="hidden" value="' + $('.flickr-photo-checked').attr('src') +'">');
    $('.simple_form.edit_card').append('<input id="token" name="id" type="hidden" value="' + card_id +'">');
    // $('#edit_card_' + card_id).submit();
  });

  $('.change-image-button').click(function() {
    var card_id = $(this).data('cardId');
    $('.change-image-button').hide();
    $('.simple_form.edit_card.inside_card').show();
    // .append('<form class="simple_form edit_card" id="edit_card_' + card_id + '" enctype="multipart/form-data" data-remote="true" action="/cards/' + card_id + '" accept-charset="UTF-8" method="PATCH"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="PATCH"></form>');
    // $('.simple_form.edit_card').append('<label class="file optional" for="card_image">Изображение</label>')
    //                            .append('<input class="file optional" type="file" name="card[image]" id="card_image">')
    //                            .append('<button type="button" class="button" data-toggle="modal" data-target="#modal-window">Загрузить с Flickr</button>')
    //                            .append('<input type="submit" name="commit" value="Изменить" class="btn btn btn-default" data-disable-with="Изменить">');

  });

  $('body').on('click', '.flickr-confirm-button.ready', function(){
    $('.form-group-image-picker').children('.image-picker').remove();
    $('.form-group-image-picker').append('<img class="flickr_photo" src="' + $('.flickr-photo-checked').attr('src') +'">');
    $('.form-group-image-picker').append('<input id="token" name="card[image_flickr_url]" type="hidden" value="' + $('.flickr-photo-checked').attr('src') +'">');
  });



  $('#card_image').change(function() {
    console.log('trigger');
    $('.download-from-flickr-button').hide();
  });
});

// <button type="button" class="button" data-toggle="modal" data-target="#modal-window">Изменить изображение</button>

// $('.form-group-image-picker').append('<div class="image-picker"></div>');
// $('.image-picker').append('<div class="input file optional card_image"></div>');
// $('.input.file.optional.card_image').append('<label class="file optional" for="card_image">Изображение</label>');
//                                     .append('<input class="file optional" type="file" name="card[image]" id="card_image">');

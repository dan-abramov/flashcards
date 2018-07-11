 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $("body").on("click", ".flickr_photo", function(){
    console.log('hello!');
    $('.flickr_photo').removeClass('flickr-photo-checked');
    $(this).addClass('flickr-photo-checked');
  });
});

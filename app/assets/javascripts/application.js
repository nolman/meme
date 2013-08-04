// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function(){
  function write_meme(canvas, image, ratio, caption_upper, caption_lower){
    canvas.width = image.width;
    canvas.height = image.height;
    var context = canvas.getContext('2d');
    context.clearRect(0, 0, image.width, image.height);
    context.drawImage(image, 0, 0);
    context.lineWidth = 2;
    context.textAlign = "center"
    context.lineCap = "round"
    context.fillStyle = "#FFFFFF";
    context.lineStyle = "#000000";
    context.textBaseline = 'top';
    write_caption(context, caption_upper, ratio, image.width, 0)
    context.textBaseline = 'bottom';
    write_caption(context, caption_lower, ratio, image.width, image.height)
  }

  function write_caption(context, text, ratio, width, y) {
    var size = 70 * ratio;
    var side_padding = 20 * ratio;
    do {
      size--;
      context.font = size + 'px Impact';
      context.lineWidth = size / 32;
    } while(context.measureText(text).width > (width-side_padding));
    context.fillText(text, width/2, y);
    context.strokeText(text, width/2, y);
  }

  $("canvas.meme").each(function(index, element){
    var canvas = element;
    var image_url = $(element).attr("image_src");
    var caption_upper = $(element).attr("upper_caption") || "";
    var caption_lower = $(element).attr("lower_caption") || "";
    var ratio = $(element).attr("ratio");
    var image = new Image();

    image.onload = function() {
      write_meme(canvas, image, ratio, caption_upper, caption_lower);
    };
    image.src = image_url;
    var upper_input = $(".caption-upper");
    var lower_input = $(".caption-lower");
    $("input.meme").on("keyup", function(){
      write_meme(canvas, image, ratio, upper_input.val(), lower_input.val());
    });
  });

});

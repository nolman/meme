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
  function write_meme(canvas, image, ratio, caption_upper, caption_lower, font){
    canvas.width = image.width;
    canvas.height = image.height;
    var font_data = font.split(" ");
    var font_size = parseInt(font_data.shift().replace("px", "")) * ratio;
    font_data.unshift(font_size + "px");
    var context = canvas.getContext('2d');
    context.clearRect(0, 0, image.width, image.height);
    context.drawImage(image, 0, 0);
    context.lineWidth = 2;
    context.textAlign = "center"
    context.lineCap = "round"
    context.fillStyle = "#FFFFFF";
    context.lineStyle = "#000000";
    context.textBaseline = 'top';
    context.font = font_data.join(" ");
    context.lineWidth = 2;
    write_caption(context, caption_upper, ratio, image.width, 0, font_size)
    context.textBaseline = 'bottom';
    write_caption(context, caption_lower, ratio, image.width, image.height, font_size)
  }

  function write_caption(context, text, ratio, width, y, font_size) {
    text = text.replace(/\s+/, " ")
    var width_with_padding = width - (20 * ratio);
    var lines = [text.split(" ")];
    var current_line = 0;
    var center = width/2;

    while(current_line < lines.length) {
      while(context.measureText(lines[current_line].join(" ")).width > (width_with_padding)) {
        //Word is too big for one line
        if(lines[current_line].length == 1) {
          break;
        }
        var word_to_shift = lines[current_line].pop();
        if(lines[current_line+1]) {
          lines[current_line+1].unshift(word_to_shift);
        } else {
          lines.push([word_to_shift])
        }
      }
      current_line++;
    }

    for(var i=0; i<lines.length; i++){
      var line = lines[i].join(" ");
      if(y == 0){
        var line_y = y + (i * font_size);
      } else {
        var line_y = y - ((lines.length - 1 - i) * font_size);
      }
      context.fillText(line, center, line_y);
      context.strokeText(line, center, line_y);
    }
  }

  $("canvas.meme").each(function(index, element){
    var canvas = element;
    var image_url = $(element).attr("image_src");
    var caption_upper = $(element).attr("upper_caption") || "";
    var caption_lower = $(element).attr("lower_caption") || "";
    var font = $(element).attr("font") || "60px Impact";
    var ratio = $(element).attr("ratio");
    var image = new Image();

    image.onload = function() {
      write_meme(canvas, image, ratio, caption_upper, caption_lower, font);
    };
    image.src = image_url;
    var upper_input = $("input.caption-upper");
    var lower_input = $("input.caption-lower");
    var font_input = $("input.font");
    $("input.meme").on("keyup", function(){
      write_meme(canvas, image, ratio, upper_input.val(), lower_input.val(), font_input.val());
    });
  });

});

// number of cells in a row (and number of rows)
var a = prompt("how many cells in a row?");
// function for creating board
$(document).ready(function(){
    for (var i = 0; i < a; i++) {
        $(".grid").append("<div class='row row"+i+"'></div>");
        for (var j = 0; j < a; j++) {
          $(".row"+i).append("<div class='cell'></div>");
        }
    };
    $(".cell").mouseenter(function(){
        $(this).css("background", randomColor())
    });
    $("button, input[type='refresh']").click(function(){
        $(".cell").css("background", "white");
    });
});
//
function randomColor(){
  var hex = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += hex[Math.floor(Math.random() * 16)];
  }
  return color;
};

/*用于管理menu的show和hide*/
function menuToggle(){
  $.get("/pushes/navi_menu", function(data){
    // alert(data); // for testing
  });
  $("#menu").fadeToggle();
}


// $(function(){
//   $(document).on('click', "#menu_toggle", function(){
//     $.get("/pushes/navi_menu", function(data){
//         // alert(data);
//       });
//     $("#menu").fadeToggle();
//   })
// });
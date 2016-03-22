$(function(){

  Sortable.create(todoList, { /* options */ });

  $("#submit-button").click(function(){
    addListItem();
  });

  $('#item-box').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      addListItem();
    }
  });

  $(".todo-list").on("change", ".check", function() {
    checkItem($(this).parent());
  });

  $(".todo-list").on("click", ".fa-trash-o", function(){
    removeItem($(this).parent());
  });

  $('#title-container').on('click', 'h1', function(){
    replaceHeading($(this));
  });

  $('#title-container').on('keypress', '#title-input', function(event){
    replaceTextbox($(this));
  });

})

function addListItem() {
  var newTodo = $('#item-box').val();

  // $('.todo-list').append(
  //   $('<li>').append(newTodo)
  // )

  $('.todo-list').append('<li class="list-group-item"><input class="check" type="checkbox">' + newTodo + '<i class="fa fa-trash-o"></i></li>')
  $('#item-box').val('');
}

function removeItem(item) {
  item.remove();
}

function checkItem(item){
  item.toggleClass('crossed');
}

function replaceHeading(heading){
  var title = heading.text();
  heading.parent().html("<input id='title-input' type='text' value='" + title + "'>");
}

function replaceTextbox(textbox){
  var keycode = (event.keyCode ? event.keyCode : event.which);
  if(keycode == '13'){
    var newHeading = textbox.val();
    textbox.parent().html("<h1>" + newHeading + "</h1>")
  }
}

// $(document).ready(function(){
//
// })

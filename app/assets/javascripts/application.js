//= require jquery
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var hideNewForm = function () {
  $("#new-question-link").show();
  $("#new_question").remove();
  $("#cancel-button").remove();
}

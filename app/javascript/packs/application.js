//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('#book-search').change(function() {
    $(this).closest('form').submit();
  });

  $('#q_author_id_eq').change(function() {
    $(this).closest('form').submit();
  });
});

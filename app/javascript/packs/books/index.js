$(document).ready(function() {
  $('#book-search').change(function() {
    $(this).closest('form').submit();
  });

  $('#q_author_id_eq').change(function() {
    $(this).closest('form').submit();
  });
});

$ ->
  $('.hide_button').button({ icons: {secondary:'ui-icon-triangle-1-s'} })
  $('.post_footer :submit').button()
  $('.post_footer').hide()
  $('.hide_button').click ->
    post_id = $(this).attr('data-post-id')
    $(".post_footer[data-post-id='" + post_id + "']").toggle()
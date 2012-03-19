$ ->
  $('.hide_button').button({ icons: {secondary:'ui-icon-triangle-1-s'} })
  $('.post_footer :submit').button()
  $('.post_footer').hide()
  $('form[action="/public/create_comment"]').bind("ajax:beforeSend", (evt, xhr, settings) ->
    website = $(this).find('input[name="comment[website]"]').val()
    unless website.match(/^http|^https/)
      alert("Website address must start with 'http:\\' or 'https:\\'")
    )
  $('.hide_button').click ->
    post_id = $(this).attr('data-post-id')
    $(".post_footer[data-post-id='" + post_id + "']").toggle()
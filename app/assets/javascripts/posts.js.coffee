$ ->
  $('.back_button').button({ icons: {primary:'ui-icon-triangle-1-w'} })
  $('.hide_button').button({ icons: {secondary:'ui-icon-triangle-1-s'} })
  $('.post_footer :submit').button()
  $('.post_footer').hide()
  $('form[action="/public/create_comment"]').bind("ajax:beforeSend", (evt, xhr, settings) ->
    $website_field = $(this).find('input[name="comment[website]"]')
    post_id = $website_field.attr('data-post-id')
    website = $website_field.val()
    unless website.match(/^http|^https|^$/)
      xhr.abort()
      $website_field.css("background-color","#FFCCCC")
      $('#post_' + post_id + '_website_error').text(" Please enter your website address with a http:// or https:// at the beginning.")
    )
  $('form[action="/public/create_comment"]').bind("ajax:complete", (evt, xhr, settings) ->
    $website_field = $(this).find('input[name="comment[website]"]')
    post_id = $website_field.attr('data-post-id')
    $('form').each ->
      $website_field.css("background-color","#FFFFFF")
      $('#post_' + post_id + '_website_error').text("")
      this.reset()
    )
  $('.hide_button').click ->
    post_id = $(this).attr('data-post-id')
    $(".post_footer[data-post-id='" + post_id + "']").toggle()
    if $(this).button( "option", "label" ) == "Show Comments"
      $(this).button( "option", "label", "Hide Comments" )
    else
      $(this).button( "option", "label", "Show Comments" )
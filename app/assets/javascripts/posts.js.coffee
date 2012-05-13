$ ->
  dp.SyntaxHighlighter.HighlightAll('code',false,false)
  $('.back_button').button({ icons: {primary:'ui-icon-triangle-1-w'} })
  $('.hide_button').button({ icons: {secondary:'ui-icon-triangle-1-s'} })
  $('.post_footer :submit').button()
  $('.post_footer').hide()
  $('form[action="/public/create_comment"]').bind("ajax:beforeSend", (evt, xhr, settings) ->
    $website_field = $(this).find('input[name="comment[author_url]"]')
    post_id = $website_field.attr('data-post-id')
    website = $website_field.val()
    unless website.match(/^http|^https|^$/)
      xhr.abort()
      $website_field.css("background-color","#FFCCCC")
      $('#post_' + post_id + '_author_url_error').text(" Please enter your website address with a http:// or https:// at the beginning.")
    )
  $('form[action="/public/create_comment"]').bind("ajax:complete", (evt, xhr, settings) ->
    $website_field = $(this).find('input[name="comment[author_url]"]')
    post_id = $website_field.attr('data-post-id')
    $('form').each ->
      $website_field.css("background-color","#FFFFFF")
      $('#post_' + post_id + '_author_url_error').text("")
      this.reset()
    )
  $('.hide_button').click (event) ->
    post_id = $(this).attr('data-post-id')
    $(".post_footer[data-post-id='" + post_id + "']").toggle()
    if $(@).button( "option", "label" ) == "Show Comments"
      $(@).button( "option", "label", "Hide Comments" )
    else
      $(@).button( "option", "label", "Show Comments" )
    button_icon = $(this).button( "option", "icons" ).secondary
    if button_icon == 'ui-icon-triangle-1-s'
      $(@).button( "option", "icons", {secondary:'ui-icon-triangle-1-n'} )
    else
      $(@).button( "option", "icons", {secondary:'ui-icon-triangle-1-s'} )
    event.preventDefault()

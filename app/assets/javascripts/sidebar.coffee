toggleSidebar = () ->
  if $('.sidebar').width() > 60
    $('.sidebar').width(56)
  else
    $('.sidebar').width(278)

  $('.sidebar-expanded').toggle()
  $('.sidebar-header:visible').css('display', 'inline-block')
  $('.sidebar-collapsed').toggle()

$(document).ready ->
  # if the screen loads with a smaller size
  if $(document).width() < 767
    toggleSidebar()
    console.log('smol')

  $(document).on 'click', '.sidebar-toggle-indicator', ->
    toggleSidebar()

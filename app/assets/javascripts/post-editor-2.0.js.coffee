$(document).ready ->
  textarea = $('#source')
  editor = $('#post_editor')
  previewer = new Previewer('post_preview',
    textarea,
    (preview) ->
      
  )
  preview_buttons = $('.preview_button')
  showEditor ->


  showPreview ->


  isEditorShown = false
  $('.preview_button').click (e) ->
    if isEditorShown then showPreview() else showEditor()

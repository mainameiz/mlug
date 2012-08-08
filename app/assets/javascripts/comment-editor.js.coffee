$(document).ready ->
  $('.comment').each (index) ->
    new CommentEditor($(@),
      (form) ->
        @tag.children('.replays').prepend(form)
    )

  new_comment_form = $('#new_comment')
  previewer = new Previewer('preview_new_comment',
    new_comment_form.find('textarea'),
    (preview) ->
      $('#comments').append(preview)
  )
  new_comment_form.find('input[name="preview"]').click (e) ->
    previewer.show()
    e.preventDefault()

$(document).ready(function() {
  $textarea = $('#source');
  //$post_form = $('.post_form');
  $editor = $('#post_editor');
  $preview = $('#post_preview');
  $preview_buttons = $('.preview_button')

  var converter = new Showdown.converter();
  var default_content = $preview.html();
  var preview_text = $preview_buttons.first().attr('value');
  var edit_text = $preview_buttons.first().attr('data-edit-text');

  var isEditorShown;

  function showEditor() {
    $preview.hide();
    $editor.show();
    isEditorShown = true;
    $preview_buttons.val(preview_text);
  };

  function showPreview() {
    $editor.hide();
    var val = $textarea.val();
    if (val === "") {
      $preview.html(default_content);
    } else {
      var content = val.replace(/&/g, '&amp;')
        .replace(/\"/g, '&quot;')
        .replace(/>/g, '&gt;')
        .replace(/</g, '&lt;')
      content = converter.makeHtml(content);
      $preview.html(content);
    }
    $preview.show();
    isEditorShown = false;
    $preview_buttons.val(edit_text);
  }

  function toggleEditorPreview(e) {
    isEditorShown ? showPreview() : showEditor();
    e.preventDefault();
  }

  $preview_buttons.click(toggleEditorPreview)

  showEditor();
}); 

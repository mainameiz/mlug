$(document).ready =>
  class @Previewer
    @commentTemplate: $('#comment_template')
    @md2html: markdown.toHTML
  
    constructor: (@id, @textarea, @func) ->
      
    show: ->
      unless @preview
        @preview = $(Previewer.commentTemplate.html())
        @preview.attr('id', @id)
        @text = @preview.find('.comment_text')
        @func(@preview)
      @text.html(Previewer.md2html(@textarea.val()))
      if @text.html().length
        @preview.show()
      else
        @preview.hide()
  
    hide: ->
      if @preview
        @preview.hide()
  
  class @CommentEditor
    @commentFormTemplate: $('#comment_form_template')
    @editors: {}
    @currentEditor: undefined
   
    constructor: (@tag, @appendFormFunc) ->
      @id_attr = @tag.attr 'id'
      @id = @id_attr.replace /comment\_/, ''
      CommentEditor.editors[@id] = @
      @tag.children('.comment_actions').find('a').click (e) =>
        @show()
        e.preventDefault()
  
    show: ->
      curr = CommentEditor.currentEditor
      if curr
        curr.hide()
  
      unless @form
        @form = $(CommentEditor.commentFormTemplate.html().replace(/COMMENT/g, @id)).attr('id', @id_attr+'_form')
        @form.find('input[name="preview"]').click (e) =>
          unless @previewer
            @previewer = new Previewer('preview_' + @id_attr,
              @form.find('textarea'),
              (preview) =>
                @form.before(preview)
            )
          @previewer.show()
          @toolbar.show()
          e.preventDefault()
        @appendFormFunc.call(@, @form)
      unless @toolbar
        @toolbar = new MarkdownToolbar(@form.find('textarea'))
      @form.show()
      @toolbar.show()
      @previewer.show() if @previewer
      CommentEditor.currentEditor = @
  
    hide: ->
      @form.hide() if @form
      @previewer.hide() if @previewer
      @toolbar.hide() if @toolbar

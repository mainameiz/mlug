class @MarkdownToolbar
  @render: _.template('
    <div class="markdown-toolbar">
      <span>B</span>
      <span>I</span>
    </div>
    ')
    ###
    <div class="markdown-toolbar">
      <span><img src="<%= buttons[\'bold\'] %>" height="<%= height %>" width="<%= width %>"/></span>
      <span><img src="<%= buttons[\'italic\'] %>" height="<%= height %>" width="<%= width %>"/></span>
    </div>
    ')
    ###

  constructor: (@textarea) ->
    @toolbar = $(MarkdownToolbar.render({
      buttons: {
        bold: '/assets/bold.png',
        italic: '/assets/italic.png'
      },
      height: '40px',
      width: '40px'
    }))
    
    @toolbar.height('20px').width('20px').css({
      border: '1px solid black',
      position: 'absolute'
    }).hide()
    $('body').prepend(@toolbar)

  show: ->
    if @toolbar
      offset = @textarea.offset()
      width = @textarea.width()
      top = offset.top + 20
      left = offset.left + width + 20
      @toolbar.css({
        top: top
        left: left
      })
      @toolbar.show()

  hide: ->
    if @toolbar
      @toolbar.hide()

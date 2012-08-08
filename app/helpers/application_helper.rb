module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def devise_registration_error_messages!(template_name)
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("devise.registrations.errors.messages.#{template_name}.not_saved",
                      :count => resource.errors.count,
                        :resource => resource.class.model_name.human.downcase)

                      html = <<-HTML
<div id="error_explanation">
<h2>#{sentence}</h2>
<ul>#{messages}</ul>
</div>
                      HTML

                      html.html_safe
  end

  def info_messages
    puts flash[:error]
    if flash[:error]
      flash[:error].to_s
    end
    if notice
      notice
    end
    if alert
      alert
    end
  end

=begin
  def redcarpet_markdown(text)
    render = Redcarpet::Render::HTML.new({
      filter_html: true,
      no_styles: true,
      hard_wrap: true
    })
    markdown = Redcarpet::Markdown.new(render, {
      no_intra_emphasis: true,
      fenced_code_blocks: true
    })
    markdown.render(ERB::Util.html_escape(text)).html_safe
  end
=end

  def showdown_markdown(text, cut)
    c = V8::Context.new
    #showdown = File.read(Rails.root.join('vendor/assets/javascripts/showdown.js'))
    markdown = File.read(Rails.root.join('vendor/assets/javascripts/markdown.js'))
    #c.eval(showdown)
    c.eval('window = {}')
    c.eval(markdown)
    #c.eval("conv = (new Showdown.converter())")
    #c[:conv].makeHtml(ERB::Util.html_escape(text)).html_safe
    c[:window].markdown.toHTML(text, "Gruber", { cut: cut }).html_safe
  end

=begin
  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
=end
end

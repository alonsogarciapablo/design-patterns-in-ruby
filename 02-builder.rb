# 02. BUILDER PATTERN

# director
class TextPrinter

  def initialize(opts)
    @formatter = opts.fetch(:formatter)
  end

  def print(text)
    header = text[0]
    body = text[1]
    footer = text[2]

    @formatter.build_header(header)
    @formatter.build_body(body)
    @formatter.build_footer(footer)

    puts @formatter.getFormattedText()
  end
end

# builder
class Formatter
  def build_header(header)
    raise NotImplementedError
  end

  def build_body(body)
    raise NotImplementedError
  end

  def build_footer(footer)
    raise NotImplementedError
  end

  def getFormattedText
    raise NotImplementedError
  end
end

# concrete builder
class HTMLFormatter < Formatter
  def build_header(header)
    @header = "<h1>#{ header }</h1>"
  end

  def build_body(body)
    @body = "<p>#{ body }</p>"
  end

  def build_footer(footer)
    @footer = "<small>#{ footer }</small>"
  end

  def getFormattedText
    [@header, @body, @footer].join("\n")
  end
end

# concrete builder
class MarkdownFormatter < Formatter
  def build_header(header)
    @header = "##{ header }"
  end

  def build_body(body)
    @body = body
  end

  def build_footer(footer)
    @footer = "*#{ footer }*"
  end

  def getFormattedText
    [@header, @body, @footer].join("\n")
  end
end

# client

header = 'Builder Pattern'
body = <<-eos
The builder pattern is an object creation software design pattern.
Unlike the abstract factory pattern and the factory method pattern whose
intention is to enable polymorphism, the intention of the builder pattern
is to find a solution to the telescoping constructor anti-pattern
eos
footer = '©2015 wadus'
text = [header, body, footer]

# Print using the HTMLFormatter
html_formatter = HTMLFormatter.new
console = TextPrinter.new(formatter: html_formatter)
console.print(text)

# Print using the MarkdownFormatter
markdown_formatter = MarkdownFormatter.new
console = TextPrinter.new(formatter: markdown_formatter)
console.print(text)


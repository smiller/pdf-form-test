require 'hexapdf'

template_name = "./SimpleForm.pdf"

pdf = HexaPDF::Document.open(template_name)

field = pdf.object(22)
field[:V] = "2019-09-09"
field[:Ff] ||= 0
field[:Ff] |= (1 << 0) # readonly

filled_in_name = "./FilledInForm.pdf" 
pdf.write(filled_in_name)

optimized_name = "./FilledInFormOptimized.pdf" 

package = HexaPDF::Document.new
pdf = HexaPDF::Document.open(filled_in_name)
pdf.pages.each { |page| package.pages << package.import(page) }
package.task(:optimize, compact: true,
                        object_streams: :delete)

package.write(optimized_name)

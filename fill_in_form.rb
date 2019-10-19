require 'hexapdf'

# SimpleForm1

## Get empty form
template_name1 = "./SimpleForm1.pdf"
pdf = HexaPDF::Document.open(template_name1)

## Set field value
field = pdf.object(22)
field[:V] = "2019-01-01"
field[:Ff] ||= 0
field[:Ff] |= (1 << 0) # readonly

## Set NeedAppearances, required for Acrobat
pdf.catalog[:AcroForm][:NeedAppearances] = true

## Save form with field and NeedAppearances
filled_in_name1 = "./FilledInForm1.pdf" 
pdf.write(filled_in_name1)

## Save optimized version
optimized_name1 = "./FilledInForm1Optimized.pdf" 
pdf = HexaPDF::Document.open(filled_in_name1)
pdf.task(:optimize, compact: true,
                    object_streams: :delete)
pdf.write(optimized_name1)

# SimpleForm2

## Get empty form
template_name2 = "./SimpleForm2.pdf"
pdf = HexaPDF::Document.open(template_name2)

## Set field value
field = pdf.object(22)
field[:V] = "2019-02-02"
field[:Ff] ||= 0
field[:Ff] |= (1 << 0) # readonly

## Set NeedAppearances, required for Acrobat
pdf.catalog[:AcroForm][:NeedAppearances] = true

## Save form with field and NeedAppearances
filled_in_name2 = "./FilledInForm2.pdf" 
pdf.write(filled_in_name2)

## Save optimized version
optimized_name2 = "./FilledInForm2Optimized.pdf" 
pdf = HexaPDF::Document.open(filled_in_name2)
pdf.task(:optimize, compact: true,
                    object_streams: :delete)
pdf.write(optimized_name2)

# Combine forms
package_name = "./CombinedForms.pdf"
package = HexaPDF::Document.new

[optimized_name1, optimized_name2].each do |name|
  pdf = HexaPDF::Document.open(name)
  pdf.pages.each { |page| package.pages << package.import(page) }
end

package.write(package_name)

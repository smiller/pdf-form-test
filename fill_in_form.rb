require 'hexapdf'

# Get empty form
template_name = "./SimpleForm.pdf"
pdf = HexaPDF::Document.open(template_name)

# Set field value
field = pdf.object(22)
field[:V] = "2019-09-09"
field[:Ff] ||= 0
field[:Ff] |= (1 << 0) # readonly

# Set NeedAppearances, required for Acrobat
pdf.catalog[:AcroForm][:NeedAppearances] = true

# Save form with field and NeedAppearances
filled_in_name = "./FilledInForm.pdf" 
pdf.write(filled_in_name)

# Save optimized version
optimized_name = "./FilledInFormOptimized.pdf" 
pdf = HexaPDF::Document.open(filled_in_name)
pdf.task(:optimize, compact: true,
                    object_streams: :delete)
pdf.write(optimized_name)

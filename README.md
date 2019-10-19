# pdf-form-test #

A testbed to explore why 

* creating a pdf form with a field (`SimpleForm.pdf`)
* then filling in that field programmatically, and then optimizing the result (`ruby fill_in_form.rb`, after running `bundle` to get hexapdf version 0.10, resulting in `FilledInForm.pdf` and `FilledInFormOptimzed.pdf`, though the files are also committed to the repo to save time)
* then opening either `FilledInForm.pdf` or `FilledInFormOptimized.pdf` in preview shows the fields as read-only, but opening it in Acrobat shows them as empty form fields until you click into the field and then the read-only contents are shown.
* (anticipating the next question, the `hexapdf ins` results of both files are at `hexapdf-ins-FilledInForm` and `hexapdf-ins-FilledInFormOptimized`.)

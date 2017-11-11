#Style Guide

##Variable Naming
So, for context, style includes things like variable naming conventions. Here are five standard ones:
•	alllowercase: e.g. adjustcolor
•	period.separated: e.g. plot.new
•	underscore_separated: e.g. numeric_version
•	lowerCamelCase: e.g. addTaskCallback
•	UpperCamelCase: e.g. SignatureMethod
Style guides don’t just tell you which naming convention to use, and even then it’s important to note that they may use one convention for variables and another for functions. They also include a range of guidelines on use of indents, spacing, and such.


##Other Style Guides
•	Bioconductor’s coding standards http://wiki.fhcrc.org/bioc/Coding_ Standards 
•	Hadley Wickham’s style guide http://stat405.had.co.nz/r-style.html  or http://adv-r.had.co.nz/Style.html
•	Google’s R style guide http://google-styleguide.googlecode.com/ svn/trunk/google-r-style.html
•	Colin Gillespie’s R style guide http://csgillespie.wordpress.com/2010/ 11/23/r-style-guide/
•	4D Pie Charts https://4dpiecharts.com/r-code-style-guide/ 

I also found 2012 research about what standards are commonly used by Cran R programs but that’s less important than the question of what do we commonly use. I have zero interest in creating our own style guide from scratch or mixing and matching. Let’s use an existing one that we may choose to expand.

So, my dear coders, I guess I’m interested in two questions:
1)	What coding guides do you like. You can rank order if you want, but I think it’s enough to just say yes/no and maybe a comment that appeals to you. One factor to consider here is whether it covers cases that we handle a lot.
2)	Which coding guides fit best the existing code we’ve created or worked with (hence ccing Loren).

I’ve no intention of require changing over past code. I just want to make sure the csis360 package, which will have the slowest to change function names and variables, follows the package we choose from the start.

Greg

p.s. For SQL column names, I’m largely committed to UpperCamelCase, although we’re not perfectly consistent with that (see fiscal_year). However, column names are different than variable names and it’s easy enough to convert over. As a complication, FPDS uses underscore_seperated and we don’t because of initial style advice received when I was first changed for SQL server, so I don’t think the SQL side of thing has any easy answers. Also, today I’m just concerned with R coding style as I want to get it right in the csis360 pacakage.



So, we started this awhile ago. Our basic approach was to do a combination of Google and Hadley’s (which is largely based on Google’s) style guide. 

That does seem like a fine answer to me, but I’ll note that Hadley’s standard is to use underscores “_”. Google’s is to use periods.
 
I think the reason Hadley isn’t using them is something to do with S3 objects which we aren’t presently using.
 
But glancing through the server.R file in the FPDS chartmaker, we’re using underscores in our variable names.
 
So if we want to commit to the approach you outline here, that’s fine by me, but our existing practice seems mixed and I want to highlight that discrepancy before we make a more formal commitment.
 
I think that document was half reflective of what I was doing at the time and half aspirational.  Stuff that I worked on later didn't all follow it, particularly:
I used snake_case as Hadley recommends, largely because I found it easier to read.
I eventually stopped adding closing parentheses on separate lines, because good indentation makes function open and close clear enough already.
I didn't follow all of Google's recommendations for commenting user-defined functions, which seemed excessive.  Roxygen2 comments will render this point moot in the context of package development anyway.
Thanks for keeping me in the loop, I'm excited to see where you guys are taking this going forward!
Loren

## Picking Colors

Check out (Melanie Frazier's guide to R colors and palettes)[https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf].

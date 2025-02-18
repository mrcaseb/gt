% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/opts.R
\name{opt_css}
\alias{opt_css}
\title{Option to add custom CSS for the table}
\usage{
opt_css(data, css, add = TRUE, allow_duplicates = FALSE)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{css}{The CSS to include as part of the rendered table's \verb{<style>}
element.}

\item{add}{If \code{TRUE}, the default, the CSS is added to any already-defined
CSS (typically from previous calls of \code{\link[=opt_table_font]{opt_table_font()}}, \code{opt_css()}, or,
directly setting CSS the \code{table.additional_css} value in \code{\link[=tab_options]{tab_options()}}).
If this is set to \code{FALSE}, the CSS provided here will replace any
previously-stored CSS.}

\item{allow_duplicates}{When this is \code{FALSE} (the default), the CSS provided
here won't be added (provided that \code{add = TRUE}) if it is seen in the
already-defined CSS.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
The \code{opt_css()} function makes it possible to add CSS to a \strong{gt} table. This
CSS will be added after the compiled CSS that \strong{gt} generates automatically
when the object is transformed to an HTML output table. You can supply \code{css}
as a vector of lines or as a single string.
}
\section{Examples}{


Use \code{\link{exibble}} to create a \strong{gt} table and format the data in both columns.
With \code{opt_css()}, insert CSS rulesets as as string and be sure to set the
table ID explicitly (here as \code{"one"}).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble \%>\%
  dplyr::select(num, currency) \%>\%
  gt(id = "one") \%>\%
  fmt_currency(
    columns = currency,
    currency = "HKD"
  ) \%>\%
  fmt_scientific(
    columns = num
  ) \%>\%
  opt_css(
    css = "
    #one .gt_table \{
      background-color: skyblue;
    \}
    #one .gt_row \{
      padding: 20px 30px;
    \}
    #one .gt_col_heading \{
      text-align: center !important;
    \}
    "
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_css_1.png" alt="This image of a table was generated from the first code example in the `opt_css()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

9-11
}

\seealso{
Other table option functions: 
\code{\link{opt_align_table_header}()},
\code{\link{opt_all_caps}()},
\code{\link{opt_footnote_marks}()},
\code{\link{opt_horizontal_padding}()},
\code{\link{opt_row_striping}()},
\code{\link{opt_stylize}()},
\code{\link{opt_table_font}()},
\code{\link{opt_table_lines}()},
\code{\link{opt_table_outline}()},
\code{\link{opt_vertical_padding}()}
}
\concept{table option functions}

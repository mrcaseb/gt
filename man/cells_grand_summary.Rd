% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{cells_grand_summary}
\alias{cells_grand_summary}
\title{Location helper for targeting cells in a grand summary}
\usage{
cells_grand_summary(columns = everything(), rows = everything())
}
\arguments{
\item{columns}{The names of the columns that are to be targeted.}

\item{rows}{The names of the rows that are to be targeted.}
}
\value{
A list object with the classes \code{cells_summary} and \code{location_cells}.
}
\description{
The \code{cells_grand_summary()} function is used to target the cells in a grand
summary and it is useful when applying a footnote with \code{\link[=tab_footnote]{tab_footnote()}} or
adding custom styles with \code{\link[=tab_style]{tab_style()}}. The function is expressly used in
each of those functions' \code{locations} argument. The 'grand_summary' location
is generated by the \code{\link[=grand_summary_rows]{grand_summary_rows()}} function.
}
\section{Overview of Location Helper Functions}{

Location helper functions can be used to target cells with virtually any
function that has a \code{locations} argument. Here is a listing of all of the
location helper functions, with locations corresponding roughly from top to
bottom of a table:
\itemize{
\item \code{\link[=cells_title]{cells_title()}}: targets the table title or the table subtitle depending on
the value given to the \code{groups} argument (\code{"title"} or \code{"subtitle"}).
\item \code{\link[=cells_stubhead]{cells_stubhead()}}: targets the stubhead location, a cell of which is only
available when there is a stub; a label in that location can be created by
using the \code{\link[=tab_stubhead]{tab_stubhead()}} function.
\item \code{\link[=cells_column_spanners]{cells_column_spanners()}}: targets the spanner column labels with the
\code{spanners} argument; spanner column labels appear above the column labels.
\item \code{\link[=cells_column_labels]{cells_column_labels()}}: targets the column labels with its \code{columns}
argument.
\item \code{\link[=cells_row_groups]{cells_row_groups()}}: targets the row group labels in any available row
groups using the \code{groups} argument.
\item \code{\link[=cells_stub]{cells_stub()}}: targets row labels in the table stub using the \code{rows}
argument.
\item \code{\link[=cells_body]{cells_body()}}: targets data cells in the table body using intersections of
\code{columns} and \code{rows}.
\item \code{\link[=cells_summary]{cells_summary()}}: targets summary cells in the table body using the
\code{groups} argument and intersections of \code{columns} and \code{rows}.
\item \code{\link[=cells_grand_summary]{cells_grand_summary()}}: targets cells of the table's grand summary using
intersections of \code{columns} and \code{rows}
\item \code{\link[=cells_stub_summary]{cells_stub_summary()}}: targets summary row labels in the table stub using
the \code{groups} and \code{rows} arguments.
\item \code{\link[=cells_stub_grand_summary]{cells_stub_grand_summary()}}: targets grand summary row labels in the table
stub using the \code{rows} argument.
\item \code{\link[=cells_footnotes]{cells_footnotes()}}: targets all footnotes in the table footer (cannot be
used with \code{\link[=tab_footnote]{tab_footnote()}}).
\item \code{\link[=cells_source_notes]{cells_source_notes()}}: targets all source notes in the table footer
(cannot be used with \code{\link[=tab_footnote]{tab_footnote()}}).
}

When using any of the location helper functions with an appropriate function
that has a \code{locations} argument (e.g., \code{\link[=tab_style]{tab_style()}}), multiple locations
can be targeted by enclosing several \verb{cells_*()} helper functions in a
\code{list()} (e.g., \code{list(cells_body(), cells_grand_summary())}).
}

\section{Examples}{


Use \code{\link{countrypops}} to create a \strong{gt} table. Add some styling to a grand
summary cell with with \code{\link[=tab_style]{tab_style()}} and \code{cells_grand_summary()}.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{countrypops \%>\%
  dplyr::filter(country_name == "Spain", year < 1970) \%>\%
  dplyr::select(-contains("country")) \%>\%
  gt(rowname_col = "year") \%>\%
  fmt_number(
    columns = population,
    decimals = 0
  ) \%>\%
  grand_summary_rows(
    columns = population,
    fns = list(
      change = ~max(.) - min(.)
    ),
    formatter = fmt_number,
    decimals = 0
  ) \%>\%
  tab_style(
    style = list(
      cell_text(style = "italic"),
      cell_fill(color = "lightblue")
    ),
    locations = cells_grand_summary(
      columns = population,
      rows = 1
    )
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_cells_grand_summary_1.png" alt="This image of a table was generated from the first code example in the `cells_grand_summary()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

7-14
}

\seealso{
Other helper functions: 
\code{\link{adjust_luminance}()},
\code{\link{cell_borders}()},
\code{\link{cell_fill}()},
\code{\link{cell_text}()},
\code{\link{cells_body}()},
\code{\link{cells_column_labels}()},
\code{\link{cells_column_spanners}()},
\code{\link{cells_footnotes}()},
\code{\link{cells_row_groups}()},
\code{\link{cells_source_notes}()},
\code{\link{cells_stub_grand_summary}()},
\code{\link{cells_stub_summary}()},
\code{\link{cells_stubhead}()},
\code{\link{cells_stub}()},
\code{\link{cells_summary}()},
\code{\link{cells_title}()},
\code{\link{currency}()},
\code{\link{default_fonts}()},
\code{\link{escape_latex}()},
\code{\link{google_font}()},
\code{\link{gt_latex_dependencies}()},
\code{\link{html}()},
\code{\link{md}()},
\code{\link{pct}()},
\code{\link{px}()},
\code{\link{random_id}()},
\code{\link{stub}()}
}
\concept{helper functions}

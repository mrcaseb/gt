% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tab_create_modify.R
\name{tab_footnote}
\alias{tab_footnote}
\title{Add a table footnote}
\usage{
tab_footnote(
  data,
  footnote,
  locations = NULL,
  placement = c("auto", "right", "left")
)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{footnote}{The text to be used in the footnote. We can optionally use
the \code{\link[=md]{md()}} and \code{\link[=html]{html()}} functions to style the text as Markdown or to
retain HTML elements in the footnote text.}

\item{locations}{The cell or set of cells to be associated with the footnote.
Supplying any of the \verb{cells_*()} helper functions is a useful way to target
the location cells that are associated with the footnote text. These helper
functions are: \code{\link[=cells_title]{cells_title()}}, \code{\link[=cells_stubhead]{cells_stubhead()}},
\code{\link[=cells_column_spanners]{cells_column_spanners()}}, \code{\link[=cells_column_labels]{cells_column_labels()}}, \code{\link[=cells_row_groups]{cells_row_groups()}},
\code{\link[=cells_stub]{cells_stub()}}, \code{\link[=cells_body]{cells_body()}}, \code{\link[=cells_summary]{cells_summary()}}, \code{\link[=cells_grand_summary]{cells_grand_summary()}},
\code{\link[=cells_stub_summary]{cells_stub_summary()}}, and \code{\link[=cells_stub_grand_summary]{cells_stub_grand_summary()}}. Additionally, we
can enclose several \verb{cells_*()} calls within a \code{list()} if we wish to link
the footnote text to different types of locations (e.g., body cells, row
group labels, the table title, etc.).}

\item{placement}{Where to affix footnote marks to the table content. Two
options for this are \verb{"left} or \code{"right"}, where the placement is to the
absolute left or right of the cell content. By default, however, this is
set to \code{"auto"} whereby \strong{gt} will choose a preferred left-or-right
placement depending on the alignment of the cell content.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
The \code{tab_footnote()} function can make it a painless process to add a
footnote to a \strong{gt} table. There are two components to a footnote: (1) a
footnote mark that is attached to the targeted cell text, and (2) the
footnote text (that starts with the corresponding footnote mark) that is
placed in the table's footer area. Each call of \code{tab_footnote()} will add a
different note, and one or more cells can be targeted via the location helper
functions (e.g., \code{\link[=cells_body]{cells_body()}}, \code{\link[=cells_column_labels]{cells_column_labels()}}, etc.).
}
\details{
The formatting of the footnotes can be controlled through the use of various
parameters in the \code{\link[=tab_options]{tab_options()}} function:
\itemize{
\item \code{footnotes.multiline}: a setting that determines whether footnotes each
start on a new line or are combined into a single block.
\item \code{footnotes.sep}: allows for a choice of the separator between consecutive
footnotes in the table footer. By default, this is set to a single space
character.
\item \code{footnotes.marks}: the set of sequential characters or numbers used to
identify the footnotes.
\item \code{footnotes.font.size}: the size of the font used in the footnote section.
\item \code{footnotes.padding}: the amount of padding to apply between the footnote
and source note sections in the table footer.
}
}
\section{Examples}{


Use \code{\link{sza}} to create a \strong{gt} table. Color the \code{sza} column using the
\code{\link[=data_color]{data_color()}} function, then, use \code{tab_footnote()} to add a footnote to the
\code{sza} column label (explaining what the color scale signifies).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{sza \%>\%
  dplyr::filter(
    latitude == 20 &
      month == "jan" &
      !is.na(sza)
  ) \%>\%
  dplyr::select(-latitude, -month) \%>\%
  gt() \%>\%
  data_color(
    columns = sza,
    colors = scales::col_numeric(
      palette = c("white", "yellow", "navyblue"),
      domain = c(0, 90)
    )
  ) \%>\%
  tab_footnote(
    footnote = "Color indicates height of sun.",
    locations = cells_column_labels(
      columns = sza
    )
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_footnote_1.png" alt="This image of a table was generated from the first code example in the `tab_footnote()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

2-7
}

\seealso{
Other part creation/modification functions: 
\code{\link{tab_caption}()},
\code{\link{tab_header}()},
\code{\link{tab_info}()},
\code{\link{tab_options}()},
\code{\link{tab_row_group}()},
\code{\link{tab_source_note}()},
\code{\link{tab_spanner_delim}()},
\code{\link{tab_spanner}()},
\code{\link{tab_stub_indent}()},
\code{\link{tab_stubhead}()},
\code{\link{tab_style_body}()},
\code{\link{tab_style}()}
}
\concept{part creation/modification functions}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modify_columns.R
\name{cols_width}
\alias{cols_width}
\title{Set the widths of columns}
\usage{
cols_width(.data, ..., .list = list2(...))
}
\arguments{
\item{.data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{...}{Expressions for the assignment of column widths for the table
columns in \code{.data}. Two-sided formulas (e.g, \verb{<LHS> ~ <RHS>}) can be used,
where the left-hand side corresponds to selections of columns and the
right-hand side evaluates to single-length character values in the form
\verb{\{##\}px} (i.e., pixel dimensions); the \code{\link[=px]{px()}} helper function is best used
for this purpose. Column names should be enclosed in \code{\link[=c]{c()}}. The
column-based select helpers \code{\link[=starts_with]{starts_with()}}, \code{\link[=ends_with]{ends_with()}}, \code{\link[=contains]{contains()}},
\code{\link[=matches]{matches()}}, \code{\link[=one_of]{one_of()}}, and \code{\link[=everything]{everything()}} can be used in the LHS.
Subsequent expressions that operate on the columns assigned previously will
result in overwriting column width values (both in the same \code{cols_width()}
call and across separate calls). All other columns can be assigned a
default width value by using \code{everything()} on the left-hand
side.}

\item{.list}{Allows for the use of a list as an input alternative to \code{...}.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
Manual specifications of column widths can be performed using the
\code{cols_width()} function. We choose which columns get specific widths. This
can be in units of pixels (easily set by use of the \code{\link[=px]{px()}} helper function),
or, as percentages (where the \code{\link[=pct]{pct()}} helper function is useful). Width
assignments are supplied in \code{...} through two-sided formulas, where the
left-hand side defines the target columns and the right-hand side is a single
dimension.
}
\details{
Column widths can be set as absolute or relative values (with px and
percentage values). Those columns not specified are treated as having
variable width. The sizing behavior for column widths depends on the
combination of value types, and, whether a table width has been set (which
could, itself, be expressed as an absolute or relative value). Widths for the
table and its container can be individually modified with the \code{table.width}
and \code{container.width} arguments within \code{\link[=tab_options]{tab_options()}}).
}
\section{Examples}{


Use \code{\link{exibble}} to create a \strong{gt} table. We can specify the widths of
columns with \code{cols_width()}. This is done with named arguments in \code{...},
specifying the exact widths for table columns (using \code{everything()} at the
end will capture all remaining columns).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble \%>\%
  dplyr::select(
    num, char, date,
    datetime, row
  ) \%>\%
  gt() \%>\%
  cols_width(
    num ~ px(150),
    ends_with("r") ~ px(100),
    starts_with("date") ~ px(200),
    everything() ~ px(60)
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_width_1.png" alt="This image of a table was generated from the first code example in the `cols_width()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

4-3
}

\seealso{
Other column modification functions: 
\code{\link{cols_align_decimal}()},
\code{\link{cols_align}()},
\code{\link{cols_hide}()},
\code{\link{cols_label}()},
\code{\link{cols_merge_n_pct}()},
\code{\link{cols_merge_range}()},
\code{\link{cols_merge_uncert}()},
\code{\link{cols_merge}()},
\code{\link{cols_move_to_end}()},
\code{\link{cols_move_to_start}()},
\code{\link{cols_move}()},
\code{\link{cols_unhide}()}
}
\concept{column modification functions}

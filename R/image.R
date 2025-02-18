#' Helper function for adding an image from the web
#'
#' We can flexibly add a web image inside of a table with `web_image()`
#' function. The function provides a convenient way to generate an HTML fragment
#' with an image URL. Because this function is currently HTML-based, it is only
#' useful for HTML table output. To use this function inside of data cells, it
#' is recommended that the [text_transform()] function is used. With that
#' function, we can specify which data cells to target and then include a
#' `web_image()` call within the required user-defined function (for the `fn`
#' argument). If we want to include an image in other places (e.g., in the
#' header, within footnote text, etc.) we need to use `web_image()` within the
#' [html()] helper function.
#'
#' By itself, the function creates an HTML image tag, so, the call
#' `web_image("http://example.com/image.png")` evaluates to:
#'
#' `<img src=\"http://example.com/image.png\" style=\"height:30px;\">`
#'
#' where a height of `30px` is a default height chosen to work well within the
#' heights of most table rows.
#'
#' @param url A url that resolves to an image file.
#' @param height The absolute height (px) of the image in the table cell.
#'
#' @return A character object with an HTML fragment that can be placed inside of
#'   a cell.
#'
#' @section Examples:
#'
#' Get the PNG-based logo for the R Project from an image URL.
#'
#' ```r
#' r_png_url <- "https://www.r-project.org/logo/Rlogo.png"
#' ```
#'
#' Create a tibble that contains heights of an image in pixels (one column as a
#' string, the other as numerical values), then, create a **gt** table. Use the
#' [text_transform()] function to insert the R logo PNG image with the various
#' sizes.
#'
#' ```r
#' dplyr::tibble(
#'   pixels = px(seq(10, 35, 5)),
#'   image = seq(10, 35, 5)
#' ) %>%
#'   gt() %>%
#'   text_transform(
#'     locations = cells_body(columns = image),
#'     fn = function(x) {
#'       web_image(
#'         url = r_png_url,
#'         height = as.numeric(x)
#'       )
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_web_image_1.png")`
#' }}
#'
#' Get the SVG-based logo for the R Project from an image URL.
#'
#' ```r
#' r_svg_url <- "https://www.r-project.org/logo/Rlogo.svg"
#' ```
#'
#' Create a tibble that contains heights of an image in pixels (one column as a
#' string, the other as numerical values), then, create a **gt** table. Use the
#' [tab_header()] function to insert the **R** logo SVG image once in the title
#' and five times in the subtitle.
#'
#' ```r
#' dplyr::tibble(
#'   pixels = px(seq(10, 35, 5)),
#'   image = seq(10, 35, 5)
#' ) %>%
#'   gt() %>%
#'   tab_header(
#'     title = html(
#'       "<strong>R Logo</strong>",
#'       web_image(
#'         url = r_svg_url,
#'         height = px(50)
#'       )
#'     ),
#'     subtitle = html(
#'       web_image(
#'         url = r_svg_url,
#'         height = px(12)
#'       ) %>%
#'         rep(5)
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_web_image_2.png")`
#' }}
#'
#' @family image addition functions
#' @section Function ID:
#' 8-1
#'
#' @export
web_image <- function(
    url,
    height = 30
) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  paste0("<img src=\"", url, "\" style=\"height:", height, ";\">")
}

#' Helper function for adding a local image
#'
#' We can flexibly add a local image (i.e., an image residing on disk) inside of
#' a table with `local_image()` function. The function provides a convenient way
#' to generate an HTML fragment using an on-disk PNG or SVG. Because this
#' function is currently HTML-based, it is only useful for HTML table output. To
#' use this function inside of data cells, it is recommended that the
#' [text_transform()] function is used. With that function, we can specify which
#' data cells to target and then include a `local_image()` call within the
#' required user-defined function (for the `fn` argument). If we want to include
#' an image in other places (e.g., in the header, within footnote text, etc.) we
#' need to use `local_image()` within the [html()] helper function.
#'
#' By itself, the function creates an HTML image tag with an image URI embedded
#' within. We can easily experiment with a local PNG or SVG image that's
#' available in the **gt** package using the [test_image()] function. Using
#' that, the call `local_image(file = test_image(type = "png"))` evaluates to:
#'
#' `<img src=<data URI> style=\"height:30px;\">`
#'
#' where a height of `30px` is a default height chosen to work well within the
#' heights of most table rows.
#'
#' @param filename A path to an image file.
#' @param height The absolute height (px) of the image in the table cell.
#'
#' @return A character object with an HTML fragment that can be placed inside of
#'   a cell.
#'
#' @section Examples:
#'
#' Create a tibble that contains heights of an image in pixels (one column as a
#' string, the other as numerical values), then, create a **gt** table. Use the
#' [text_transform()] function to insert a local test image (PNG) image with the
#' various sizes.
#'
#' ```r
#' dplyr::tibble(
#'   pixels = px(seq(10, 35, 5)),
#'   image = seq(10, 35, 5)
#' ) %>%
#'   gt() %>%
#'   text_transform(
#'     locations = cells_body(columns = image),
#'     fn = function(x) {
#'       local_image(
#'         filename = test_image(type = "png"),
#'         height = as.numeric(x)
#'       )
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_local_image_1.png")`
#' }}
#'
#' @family image addition functions
#' @section Function ID:
#' 8-2
#'
#' @export
local_image <- function(
    filename,
    height = 30
) {

  # Normalize file path
  filename <- path_expand(filename)

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  # Create the image URI
  uri <- get_image_uri(filename)

  # Generate the Base64-encoded image and place it within <img> tags
  paste0("<img src=\"", uri, "\" style=\"height:", height, ";\">")
}

#' Helper function for adding a ggplot
#'
#' We can add a **ggplot2** plot inside of a table with the help of the
#' `ggplot_image()` function. The function provides a convenient way to generate
#' an HTML fragment with a `ggplot` object. Because this function is currently
#' HTML-based, it is only useful for HTML table output. To use this function
#' inside of data cells, it is recommended that the [text_transform()] function
#' is used. With that function, we can specify which data cells to target and
#' then include a call to `ggplot_image()` within the required user-defined
#' function (for the `fn` argument). If we want to include a plot in other
#' places (e.g., in the header, within footnote text, etc.) we need to use
#' `ggplot_image()` within the [html()] helper function.
#'
#' By itself, the function creates an HTML image tag with an image URI embedded
#' within (a 100 dpi PNG). We can easily experiment with any `ggplot2` plot
#' object, and using it within `ggplot_image(plot_object = <plot object>`
#' evaluates to:
#'
#' `<img src=<data URI> style=\"height:100px;\">`
#'
#' where a height of `100px` is a default height chosen to work well within the
#' heights of most table rows. There is the option to modify the aspect ratio of
#' the plot (the default `aspect_ratio` is `1.0`) and this is useful for
#' elongating any given plot to fit better within the table construct.
#'
#' @param plot_object A ggplot plot object.
#' @param height The absolute height (px) of the image in the table cell.
#' @param aspect_ratio The plot's final aspect ratio. Where the height of the
#'   plot is fixed using the `height` argument, the `aspect_ratio`
#'   will either compress (`aspect_ratio` < `1.0`) or expand
#'   (`aspect_ratio` > `1.0`) the plot horizontally. The default value
#'   of `1.0` will neither compress nor expand the plot.
#'
#' @return A character object with an HTML fragment that can be placed inside of
#'   a cell.
#'
#' @section Examples:
#'
#' Create a **ggplot** plot.
#'
#' ```r
#' library(ggplot2)
#'
#' plot_object <-
#'   ggplot(
#'     data = gtcars,
#'     aes(x = hp, y = trq, size = msrp)
#'   ) +
#'   geom_point(color = "blue") +
#'   theme(legend.position = "none")
#' ```
#'
#' Create a tibble that contains two cells (where one is a placeholder for an
#' image), then, create a **gt** table. Use the `text_transform()` function to
#' insert the plot using by calling `ggplot_object()` within the user- defined
#' function.
#'
#' ```r
#' dplyr::tibble(
#'   text = "Here is a ggplot:",
#'   ggplot = NA
#' ) %>%
#'   gt() %>%
#'   text_transform(
#'     locations = cells_body(columns = ggplot),
#'     fn = function(x) {
#'       plot_object %>%
#'         ggplot_image(height = px(200))
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_ggplot_image_1.png")`
#' }}
#'
#' @family image addition functions
#' @section Function ID:
#' 8-3
#'
#' @importFrom ggplot2 ggsave
#' @export
ggplot_image <- function(
    plot_object,
    height = 100,
    aspect_ratio = 1.0
) {

  if (is.numeric(height)) {
    height <- paste0(height, "px")
  }

  # Upgrade `plot_object` to a list if only a single ggplot object is provided
  if (inherits(plot_object, "gg")) {
    plot_object <- list(plot_object)
  }

  vapply(
    seq_along(plot_object),
    FUN.VALUE = character(1),
    USE.NAMES = FALSE,
    FUN = function(x) {

      filename <-
        paste0("temp_ggplot_", formatC(x, width = 4, flag = "0") , ".png")

      # Save PNG file to disk
      ggplot2::ggsave(
        filename = filename,
        plot = plot_object[[x]],
        device = "png",
        dpi = 100,
        width = 5 * aspect_ratio,
        height = 5
      )

      on.exit(file.remove(filename))

      local_image(filename = filename, height = height)
    }
  )
}

#' Generate a path to a test image
#'
#' Two test images are available within the **gt** package. Both contain the
#' same imagery (sized at 200px by 200px) but one is a PNG file while the other
#' is an SVG file. This function is most useful when paired with [local_image()]
#' since we test various sizes of the test image within that function.
#'
#' @param type The type of the image, which can either be `png` (the default) or
#'   `svg`.
#'
#' @return A character vector with a single path to an image file.
#'
#' @family image addition functions
#' @section Function ID:
#' 8-4
#'
#' @export
test_image <- function(type = c("png", "svg")) {

  type <- rlang::arg_match(type)

  system_file(file = paste0("graphics/test_image.", type))
}

# Function for setting the MIME type
get_mime_type <- function(file) {

  extension <- tolower(get_file_ext(file))

  switch(
    extension,
    svg = "image/svg+xml",
    jpg = "image/jpeg",
    paste("image", extension, sep = "/")
  )
}

# Get image URIs from on-disk graphics files
# as a vector Base64-encoded image strings
get_image_uri <- function(file) {

  # Create a list of `raw` objects
  image_raw <-
    lapply(
      file, FUN = function(x) {
        readBin(
          con = x,
          what = "raw",
          n = file.info(x)$size
        )
      }
    )

  vapply(
    seq_along(image_raw),
    FUN.VALUE = character(1),
    USE.NAMES = FALSE, FUN = function(x) {
      paste0(
        "data:", get_mime_type(file[x]),
        ";base64,", base64enc::base64encode(image_raw[[x]])
      )
    }
  )
}

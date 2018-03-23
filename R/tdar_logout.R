#' Title
#'
#' @return
#' @export
#'
#' @examples
tdar_logout <- function(){
  httr::POST(url = "https://core.tdar.org/api/logout")
}

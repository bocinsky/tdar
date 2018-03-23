#' Title
#'
#' @param id
#'
#' @return
#' @export
#'
#' @examples
tdar_get_resource <- function(id){

  return(httr::GET(tdar_get_resource_path(id)))

}

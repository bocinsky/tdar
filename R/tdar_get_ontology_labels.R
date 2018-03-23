#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
tdar_get_ontology_labels <- function(x){
  x %>%
    purrr::map_dfr(function(i){
      ID <- i %>%
        attr("ID")

      if(is.null(ID)) return(NULL)

      Label <- i$label[[1]]

      tibble::tibble(ID = ID,
                     Label = Label)

    })
}

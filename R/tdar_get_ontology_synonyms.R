#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
tdar_get_ontology_synonyms <- function(x){
  x %>%
    purrr::map_dfr(function(i){
      ID <- i %>%
        attr("ID")

      if(is.null(ID)) return(NULL)

      equivalentClass <- i[names(i) == "equivalentClass"] %>%
        purrr::map_chr(attr, which = "resource") %>%
        stringr::str_replace_all("\\#","")

      tibble::tibble(ID = ID,
                     equivalentClass = equivalentClass)

    })
}

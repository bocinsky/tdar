#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
tdar_get_ontology_relations <- function(x){
  x %>%
    purrr::map_dfr(function(i){
      ID <- i %>%
        attr("ID") %>%
        as.character()
      if(is.null(ID)) return(NULL)

      subClassOf <- i[names(i) == "subClassOf"] %>%
        purrr::map_chr(attr, which = "resource") %>%
        stringr::str_replace_all("\\#","") %>%
        as.character()

      tibble::tibble(subClassOf = subClassOf,
                     ID = ID)

    })
}

#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
tdar_get_ontology_levels <- function(x){
  dplyr::left_join(tdar_get_ontology_labels(x),
                   tdar_get_ontology_synonyms(x),
                   by = "ID")
}

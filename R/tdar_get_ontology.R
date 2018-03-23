#' Title
#'
#' @param ontology Either a path to a tDAR ontology file,
#' a URL of an ontology resource, or an integer representing
#' a tDAR ontology.
#'
#' @return
#' @importFrom magrittr '%>%' '%$%'
#' @export
#'
#' @examples
tdar_get_ontology <- function(ontology){

  if(is.numeric(ontology))
    ontology <- tdar_get_resource(ontology) %>%
      httr::content()

  raw_ont <- ontology %>%
    xml2::read_xml() %>%
    xml2::as_list() %$%
    RDF

  ont_relations <- tdar_get_ontology_relations(raw_ont)
  ont_synonyms <- tdar_get_ontology_synonyms(raw_ont) %>%
    dplyr::filter(equivalentClass %in% (ont_relations %>% unlist()))
  ont_labels <- tdar_get_ontology_labels(raw_ont) %>%
    # tail()
    # dplyr::mutate(ID = ifelse(!is.na(ont_synonyms$equivalentClass[match(ID,ont_synonyms$ID)]),
    #                           ont_synonyms$equivalentClass[match(ID,ont_synonyms$ID)],
    #                           ID)) %>%
    # tail()
    dplyr::filter(is.na(ont_synonyms$equivalentClass[match(ID,ont_synonyms$ID)])) #%>%
    # tail()
    # dplyr::filter(ID %in% (ont_relations %>% unlist()))

  ont_relations %<>%
    dplyr::mutate_all(dplyr::funs(ont_labels$Label[match(.,ont_labels$ID)]))

  return(igraph::graph_from_data_frame(d = ont_relations,
                                       vertices = ont_labels %>%
                                         dplyr::select(Label)))

}

tdar_get_resource_filename <- function(id){

  resource_xml <- httr::GET(url=stringr::str_c("https://core.tdar.org/api/view?id=",id)) %>%
    httr::content() %>%
    xml2::as_list() %$%
    resultContainer %$%
    result

  return(resource_xml$informationResourceFiles$informationResourceFile$filename)

}

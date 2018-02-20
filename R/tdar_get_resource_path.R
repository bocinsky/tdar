tdar_get_resource_path <- function(id){

  resource_xml <- httr::GET(url=stringr::str_c("https://core.tdar.org/api/view?id=",id)) %>%
    httr::content() %>%
    xml2::as_list() %$%
    resultContainer %$%
    result

  resource_xml_latest <- attributes(resource_xml$informationResourceFiles$informationResourceFile)$latestVersion

  resource_id_latest <- resource_xml$informationResourceFiles$informationResourceFile$informationResourceFileVersions %>%
    purrr::map_lgl(function(x){
      (attr(x,"version") == resource_xml_latest & x$fileVersionType == "UPLOADED")
    })

  resource_id_latest <- attr(resource_xml$informationResourceFiles$informationResourceFile$informationResourceFileVersions[resource_id_latest][[1]], "id")

  return(stringr::str_c("https://core.tdar.org/filestore/download/",id,"/",resource_id_latest))

}

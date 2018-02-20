tdar_download_resource <- function(id,
                                   out_file = NULL,
                                   out_dir = "."){

  dir.create(out_dir,
             recursive = TRUE,
             showWarnings = FALSE)

  if(is.null(out_file))
    out_file <- stringr::str_c(out_dir,"/",
                               tdar_get_resource_filename(id))

  httr::GET(tdar_get_resource_path(id),
            httr::write_disk(out_file,
                       overwrite = TRUE))

  return(out_file)
}

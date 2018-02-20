tdar_login <- function(){
  httr::POST(url = "https://core.tdar.org/api/logout")
}

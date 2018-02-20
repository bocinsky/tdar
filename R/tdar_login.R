tdar_login <- function(tdar_user,
                              tdar_password){
  if(missing(tdar_user) || missing(tdar_password)){
    if(Sys.getenv("tdar_un") == "" || Sys.getenv("tdar_pw" == "")){
      stop("
           This function requires a username and password from TDAR and access to the TDAR API.
           If you have a username and password, pass them in as environment vars using:
           Sys.setenv(tdar_un = '<your username>', tdar_pw = '<your password>').\n
           If you do not yet have a username and password, register for one here:
           https://core.tdar.org/account/new/.\n
           To become part of the tDAR API Group, please contact the Digital Antiquity
           staff at info@digitalantiquity.org.")

    }
  }

  if(missing(tdar_user)){
    tdar_user <- Sys.getenv("tdar_un")
  }

  if(missing(tdar_password)){
    tdar_password <- Sys.getenv("tdar_pw")
  }

  httr::POST(url = "https://core.tdar.org/api/login",
             body = list(userLogin.loginUsername = tdar_user,
                         userLogin.loginPassword = tdar_password))

}

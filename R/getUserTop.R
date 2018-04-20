#'Get a user's recently played tracks
#'
#'
#'
#'@param id The ID for a spotify user
#'@param information requested, either "artists" or "tracks"
#'@return get user's tp
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getUserTop<-function(user_id,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/users/",user_id), httr::config(token = token))
  json1<-httr::content(req)
  dados=data.frame(display_name=json1$display_name,
                   id=json1$id,
                   followers=json1$followers$total,stringsAsFactors = F)
  return(dados)
}



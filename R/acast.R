#' Serialize a list 
#'
#' Write TSON specification binary-encoded format to a connection.
#'
#' @param ri 0 based row indice 
#' @param ci 0 based column indice 
#' @param values matrix values
#' @param nrow number of rows
#' @param ncol number of columns
#' @param fill value for missing values
#' @return matrix
#'
#' @examples
#' ## Example
#' @useDynLib mtercen mtercen_acast_vec
#' @export
acast = function(ri,ci,values,nrow,ncol,fill) matrix(acast_vec(as.integer(ri),
                                                               as.integer(ci),
                                                               as.double(values),
                                                               as.integer(nrow),
                                                               as.integer(ncol),
                                                               as.double(fill)))
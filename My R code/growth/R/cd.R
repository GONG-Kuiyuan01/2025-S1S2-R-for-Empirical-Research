#' Constant returns to scale production function
#' @param K capital
#' @param L labor
#' @param A total factor
#' @param theta
#' @examples cd(10, 100)
#' @author GONG Kuiyuan
#' @keywords Production function

cd <- function(K, L, theta = 2/3, A = 1){
  A*(K^theta)*(L^(1-theta))
}

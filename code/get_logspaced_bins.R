# function to get logspaced bins
get_log_bins <- function(xmin, xmax, n_bins = 30, base = 10) {
  if (!is.finite(xmin) || !is.finite(xmax)) stop("xmin and xmax must be finite.")
  if (xmin <= 0 || xmax <= 0) stop("Log bins require xmin > 0 and xmax > 0.")
  if (xmin >= xmax) stop("xmin must be < xmax.")
  if (n_bins < 1) stop("n_bins must be >= 1.")
  
  base ^ seq(
    log(xmin, base = base),
    log(xmax, base = base),
    length.out = n_bins + 1
  )
}

# function to average bins
get_interval_mean <- function(x) {
  x <- gsub("\\[|\\]|\\(|\\)", "", x)
  nums <- do.call(rbind, strsplit(x, ","))
  nums <- apply(nums, 2, as.numeric)
  rowMeans(nums)
}
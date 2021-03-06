% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measures_pairs.R
\name{contingency_table_pairs}
\alias{contingency_table_pairs}
\title{Binary Contingency Table for Linked Pairs}
\usage{
contingency_table_pairs(
  true_pairs,
  pred_pairs,
  num_pairs = NULL,
  ordered = FALSE
)
}
\arguments{
\item{true_pairs}{set of true coreferent pairs stored in a matrix or
data.frame, where rows index pairs and columns index the ids of the
constituents. Any pairs not included are assumed to be \emph{non-coreferent}.
Duplicate pairs (including equivalent pairs with reversed ids) are
automatically removed.}

\item{pred_pairs}{set of predicted coreferent pairs, following the same
specification as \code{true_pairs}.}

\item{num_pairs}{the total number of coreferent and non-coreferent pairs,
excluding equivalent pairs with reversed ids. If not provided,
the true negative cell will be set to \code{NA}.}

\item{ordered}{whether to treat the element pairs as ordered---i.e. whether
pair \eqn{(x, y)} is distinct from pair \eqn{(y, x)} for \eqn{x \neq y}.
Defaults to FALSE, which is appropriate for clustering, undirected link
prediction, record linkage etc.}
}
\value{
Returns a \eqn{2 \times 2}{2×2} contingency table of the form:
\preformatted{
             Truth
   Prediction   TRUE  FALSE
        TRUE      TP     FP
        FALSE     FN     TN
}
}
\description{
Compute the binary contingency table for a set of \emph{predicted}
coreferent (linked) pairs given a set of \emph{ground truth} coreferent pairs.
}
\examples{
### Example where pairs/edges are undirected
# ground truth is 3-clique
true_pairs <- rbind(c(1,2), c(2,3), c(1,3))
# prediction misses one edge
pred_pairs <- rbind(c(1,2), c(2,3))
# total number of pairs assuming 3 elements
num_pairs <- 3 * (3 - 1) / 2
eval_report_pairs(true_pairs, pred_pairs, num_pairs)

### Example where pairs/edges are directed
# ground truth is a 3-star
true_pairs <- rbind(c(2,1), c(3,1), c(4,1))
# prediction gets direction of one edge incorrect
pred_pairs <- rbind(c(2,1), c(3,1), c(1,4))
# total number of pairs assuming 4 elements
num_pairs <- 4 * 4
eval_report_pairs(true_pairs, pred_pairs, num_pairs, ordered = TRUE)

}
\seealso{
The \code{\link{membership_to_pairs}} and \code{\link{clusters_to_pairs}} functions can be
used to transform other clustering representations into lists of pairs,
as required by this function.
The \code{\link{eval_report_pairs}} function computes common evaluation measures
derived from binary contingency matrices, like the ones output by this
function.
}

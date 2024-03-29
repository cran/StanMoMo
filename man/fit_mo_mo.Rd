% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_mortality_model.R
\name{fit_mo_mo}
\alias{fit_mo_mo}
\title{Wrapper function to fit and forecast mortality models}
\usage{
fit_mo_mo(
  mortality_model = "lc",
  death,
  exposure,
  ages = 50:90,
  validation = 0,
  forecast = 1,
  family = "nb",
  chains = 1,
  cores = 4,
  log_marg = FALSE,
  iter = 2000
)
}
\arguments{
\item{mortality_model}{name of the mortality model}

\item{death}{death matrix}

\item{exposure}{exposure matrix}

\item{ages}{vector of ages}

\item{validation}{size of the validation set}

\item{forecast}{number of calendar years to be forecast}

\item{family}{underlying count distribution}

\item{chains}{number of Markov chains}

\item{cores}{number of cores used}

\item{log_marg}{Do we compute the marginal likelihood or not?}

\item{iter}{Length of the Markov chain trajectory}
}
\value{
a stanfit object
}
\description{
Wrapper function to fit and forecast mortality models
}
\examples{


years <- 1990:2017
ages <- 50:90
cohorts <- sort(unique(as.vector(sapply(years, function(year) year - ages))))
death <- FRMaleData$Dxt[formatC(ages),formatC(years)]
exposure <- FRMaleData$Ext[formatC(ages),formatC(years)]
stan_fit <- fit_mo_mo("m6", death , exposure, ages, 0, 5, "nb", 1, 4,
log_marg = FALSE,iter=50)
boxplot_post_dist(stan_fit, "k", ages, years)
boxplot_post_dist(stan_fit, "g", ages, years)


}

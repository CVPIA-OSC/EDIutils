% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{standard_units}
\alias{standard_units}
\title{standard_units}
\format{
A list.
}
\usage{
standard_units
}
\description{
A list of all valid standard units accepted by EML schema. This list is used
to by \code{create_attribute()}. As \code{create_attribute()} filters through all attribute components
it will check that the units are in the standard unit list.
}
\examples{
"meters" \%in\% standard_units
"meter" \%in\% standard_units
"m" \%in\% standard_units
}
\keyword{datasets}

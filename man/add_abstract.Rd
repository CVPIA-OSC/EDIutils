% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/abstract-element.R
\name{add_abstract}
\alias{add_abstract}
\title{Add Abstract}
\usage{
add_abstract(parent_element, abstract_file)
}
\arguments{
\item{parent_element}{A list representing the EML project or dataset.}

\item{abstract_file}{file path to abstract (word or markdown): see \code{\link{create_abstract}}}
}
\value{
The dataset or project with abstract appended
}
\description{
Adds the abstract metadata element to a dataset list according to EML standards.
}
\examples{
abstract_docx <- system.file("extdata", "Banet-Example", "metadata","abstract.docx", package = "EMLaide", mustWork = TRUE)  

dataset <- list() \%>\%
    add_abstract(abstract_docx)
dataset
}

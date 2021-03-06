% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-functions.R
\name{evaluate_edi_package}
\alias{evaluate_edi_package}
\title{Validate EDI Data Package}
\usage{
evaluate_edi_package(user_id, password, eml_file_path)
}
\arguments{
\item{user_id}{EDI data portal user ID. Create an account an
EDI \href{https://portal.edirepository.org/nis/login.jsp}{here}}

\item{password}{EDI data portal user password}

\item{eml_file_path}{The file path to the EML metadata document that you wish to evaluate.
(A web link to the csv must be included in the dataset information in the EML in order for a data package to be evaluated.)}
}
\value{
This package returns a data frame that contains the status of the
package. The data frame contains the following information:
\itemize{
\item The status of each check - Can be valid, info, warn, or error. Errors must be fixed before package can be uploaded to EDI.
\item A description of what each status is referring to
\item A suggestion of how to fix the status or improve the package.
}
}
\description{
This function takes in authentication info for EDI and an EML file to
be evaluated using the EDI congruence checker. This package returns a data frame that contains the status of the
package.
}
\details{
For more information about the validation services see \href{https://pastaplus-core.readthedocs.io/en/latest/doc_tree/pasta_api/data_package_manager_api.html#upload-and-evaluation}{the PASTAplus docs}
}
\examples{
\dontrun{evaluate_edi_package(user_id = "samuelwright", 
                              eml_file_path = "data/edi20.1.xml")}
}

#' @title Create Funding Element
#' @description Creates the award information of a project based off of EML standards. 
#' This award element is then nested within a project node to complete a funding section. 
#' @param funder_name Organization or individual providing the funding. If applicable, 
#' use one of the following from the helper data 
#' \code{\link{CVPIA_funders}}: "USBR", "CDWR", or "CDFW" to get pre-selected funding 
#' information. If you are funded by one of these sources 
#' please specify which one in \code{funder_name} and include an \code{award_title}. 
#' @param award_title Title of the award granted to the project.
#' @param funder_identifier (Optional) This is where the funding organization is listed in 
#' the registry. The funder identifier must be registered. Follow the instructions at 
#' \url{https://ror.org/curation/} to get registered. 
#' @param award_number (Optional) The identifier assigned by the funding agency to identify this funding award.
#' @param award_url (Optional) Optional to include a link to information about the funding
#'  award on the funding organization's webpage.
#' @param funding_description (Optional) Provide a short description of the funding received.
#' @return An award list that is then added to the project element of an EML file.  
#' @examples 
#' create_funding(funder_name = "National Science Foundation",
#'                funder_identifier = "http://dx.doi.org/10.13039/100000001",
#'                award_number = "1656026",
#'                award_title = "National Science Foundation Grant",
#'                award_url = "https://www.nsf.gov/awardsearch/showAward?AWD_ID=1656026",
#'                funding_description = "BLE LTER is supported by the National Science 
#'                                      Foundation under award #1656026 
#'                                       (2017-08-01 to 2022-07-31)." )
#' @export

create_funding <- function(funder_name, award_title, funder_identifier = NULL, 
                        award_number = NULL, award_url = NULL, funding_description = NULL)  {
  
  award <- list()
  required_arguments <- c("funder_name", "award_title", "funder_identifier", 
                          "award_number", "award_url", "funding_description")
  
  missing_argument_index <- which(c(missing(funder_name), missing(award_title), 
                                    missing(funder_identifier), missing(award_number),  
                                    missing(award_url), missing(funding_description)))
  
  if (length(missing_argument_index) > 0) {
    fund_error <- required_arguments[missing_argument_index][1]
    fund_error_message <- paste("Please provide the", fund_error)
    if (missing(funder_name) | missing(award_title)) {
      stop(fund_error_message, call. = FALSE)
    } 
  }
  if (funder_name %in% names(CVPIA_funders)){
    if (funder_name == "USBR"){
    award <- EMLaide::CVPIA_funders$USBR
    award$title = award_title
    }
    if (funder_name == "CDWR"){
    award <- EMLaide::CVPIA_funders$CDWR
    award$title = award_title
    } 
    if (funder_name == "CDFW"){
    award <- EMLaide::CVPIA_funders$CDFW
    award$title = award_title
    }
  } 
  else {
    award <- list(funderName = funder_name,
                  title = award_title)
    if (missing(award_url) | missing(award_number) | 
        missing(funder_identifier) | missing(funding_description)) {
      warning(fund_error_message, call. = FALSE)
    }
  }
  if (!is.null(funder_identifier)) {
    if (!is.na(funder_identifier)) { 
    award$funderIdentifier = funder_identifier 
    }
  }
  if (!is.null(award_number)) {
    award$awardNumber = award_number 
  }
  if (!is.null(funding_description)) {
    award$description = funding_description 
  }
  if (!is.null(award_url)) {
    award$awardUrl <- award_url
  }
  return(award)
}

#' @title Create Attribute  
#' @description Create an attribute element according to EML standards.
#' @param attribute_name The name	of a field in	a	data table. This is	often	a short
#' and/or cryptic name. It is recommended that the attribute names	be suitable	for
#' use	as a	variable,	e.g.,	composed of ASCII	characters,	and	that the attribute
#' names match the column headers of a CSV or other text table.	
#' @param attribute_definition A precise and complete	definition of the attribute	being	documented.
#' @param storage_type An indicator	to processing	systems	as to	how	the	attribute
#' might be represented in	a	system or	language,	but	is distinct	from the actual
#' expression of	the	domain of	the	attribute. A list of approved storage types can be found at 
#' \code{\link{storage_type}}
#' @param measurement_scale The	type of	scale	from which values are	drawn	for	the
#' attribute. A list of approved measurement scales can be viewed at \code{\link{measurement_scale}}.
#' Further explanation of the choices and required inputs are described below.
#' @param attribute_label (Optional) Used to provide	a	less ambiguous or	less cryptic
#' alternative identification	than what	is provided	in \code{attribute_name}.
#' @param domain Input for the non-numeric measurement scales only.
#' Please list either "text" or "enumerated".
#' @param definition Either the text definition or code definition. Both are appended
#' using this parameter, but have different applications. Examples of both are listed below.  
#' @param text_pattern (Optional) A regular expression pattern constraining the attribute.
#' @param type Either "ratio" or "interval". 
#' @param units The units assigned to this attribute's values. 
#' @param number_type A list of possible options can be viewed at \code{\link{number_type}}. 
#' @param unit_precision (Optional) How precise units are measured.
#' @param date_time_format The format your date/time attribute is recorded in.
#' ISO 8601 standard should be used (YYYY-MM-DD).
#' @param date_time_precision To what level time is being measured. 
#' @param minimum Theoretical or allowable minimum value. Values can be larger than 
#' or equal to this number. 
#' @param maximum Theoretical or allowable maximum value. Values can be less than 
#' or equal to this number. 
#' @section Measurement Scales: 
#' Different measurement scale values will indicate different inputs: 
#' 
#' ## Non-numeric: 
#' Please provide a domain to indicate if your attribute is text or enumerated.
#' 
#' \emph{Nominal:}
#' Used to define categorical scale attributes. If your attribute falls
#' under the domain of "text", please provide the inputs of \code{definition} and \code{text_pattern}.
#' If your attribute falls under the domain of "enumerated", please provide the input of \code{definition}.
#' 
#' \emph{Ordinal:}
#' Used to define ordered scale attributes. If your attribute falls under the domain 
#' of "text", please provide the inputs of \code{definition} and \code{text_pattern}. If your
#' attribute falls under the domain of "enumerated", please provide the input of \code{definition}. 
#'
#' ## Numeric:
#'
#'\emph{Interval:}
#' Used to define interval scale attributes. Please provide the inputs of \code{type},
#'  \code{units}, \code{unit_precision}, \code{number_type}, \code{minimum}, and \code{maximum}.
#' 
#' \emph{Ratio:}
#' Used to define ratio scale attributes. Please provide the inputs of \code{type}, 
#' \code{units}, \code{unit_precision}, \code{number_type}, \code{minimum}, and \code{maximum}.
#' 
#' \emph{dateTime:}
#' Used to define date and time attributes. Please provide the inputs of \code{date_time_format}, 
#' \code{date_time_precision}, \code{minimum}, and \code{maximum}.
#' 
#' @return An attribute list
#' 
#' @export
#' @examples
#' # Nominal(text):
#' \dontrun{create_attribute(attribute_name = "site_id",
#'                           attribute_definition = "Site id as used in sites table",
#'                           storage_type = EMLaide::storage_type$integer,
#'                           measurement_scale = EMLaide::measurement_scale$nominal,
#'                           domain= "text",
#'                           definition = "Site id as used in sites table.")}
#'
#' # Nominal(enumerated):
#' code_def_1 = list(code = "yes", definition = "has been captured previously")
#' code_def_2 = list(code = "no", definition = "has not been captured previously")
#' code_definition = list(code_def_1, code_def_2)
#' \dontrun{create_attribute(attribute_name = "Recap", 
#'                           attribute_definition = "Has the Turtle been captured and tagged previously",
#'                           storage_type = EMLaide::storage_type$text, 
#'                           measurement_scale = EMLaide::measurement_scale$nominal, 
#'                           domain = "enumerated",
#'                           definition = code_definition)}
#'               
#' # Ordinal(text):
#' \dontrun{create_attribute(attribute_name = "LatitudeDD", 
#'                           attribute_definition = "Latitude",
#'                           storage_type = EMLaide::storage_type$string,
#'                           measurement_scale = EMLaide::measurement_scale$ordinal,
#'                           domain= "text", 
#'                           definition = "Latitude")}
#'               
#' # Ordinal(enumerated): 
#' code_def_0 = list(code = "0", definition = "0 insects per meter of branch")
#' code_def_1 = list(code = "1", definition = "1-10 insects per meter")
#' code_def_2 = list(code = "2", definition = "11 – 100 insects per meter")
#' code_def_3 = list(code = "3", definition = "more than 100 insects per meter")
#' code_definition = list(code_def_0, code_def_1, code_def_2, code_def_3)
#' \dontrun{create_attribute(attribute_name = "hwa",
#'                           attribute_definition = "Hemlock woolly adelgid density per meter of branch",
#'                           storage_type = EMLaide::storage_type$decimal,
#'                           measurement_scale = EMLaide::measurement_scale$ordinal,
#'                           domain = "enumerated",
#'                           definition = code_definition)}
#'               
#' # Interval:
#' \dontrun{create_attribute(attribute_name = "Count",
#'                           attribute_definition = "Number of individuals observed",
#'                           measurement_scale = EMLaide::measurement_scale$interval, 
#'                           storage_type = EMLaide::storage_type$integer,
#'                           type = "interval",
#'                           units = "number",
#'                           unit_precision = "1",
#'                           number_type = EMLaide::number_type$whole, 
#'                           minimum = "0")}
#'                    
#' # Ratio: 
#' \dontrun{create_attribute(attribute_name = "pH",
#'                           attribute_definition = "pH of soil solution",
#'                           storage_type = EMLaide::storage_type$float,
#'                           measurement_scale = EMLaide::measurement_scale$ratio,
#'                           type = "ratio",
#'                           units = "dimensionless",
#'                           unit_precision = "0.01",
#'                           number_type = EMLaide::number_type$real)}
#'                    
#' # dateTime:
#' \dontrun{create_attribute(attribute_name = "Yrs", 
#'                           attribute_definition = "Calendar year of the observation from years 1990 - 2010.",
#'                           storage_type = EMLaide::storage_type$integer,
#'                           measurement_scale = EMLaide::measurement_scale$dateTime,
#'                           attribute_label = "Years",
#'                           date_time_format = "YYYY", 
#'                           date_time_precision = "1", 
#'                           minimum = "1993", 
#'                           maximum = "2003")}
create_attribute <- function(attribute_name, attribute_definition, storage_type,
                          measurement_scale, attribute_label = NULL, domain = NULL,
                          definition = NULL, text_pattern = NULL, type = NULL, 
                          units = NULL, number_type = NULL, unit_precision = NULL,
                          date_time_format = NULL, date_time_precision = NULL,
                          minimum = NULL, maximum = NULL) {
  
  required_arguments <- c("attribute_name", "attribute_definition", "storage_type", 
                             "measurement_scale")
  missing_argument_index <- which(c(missing(attribute_name), missing(attribute_definition),
                           missing(storage_type), missing(measurement_scale)))
  
  if (length(missing_argument_index) > 0) {
    missing <- required_arguments[missing_argument_index][1]
    error_message <- switch(missing, attribute_name = "Please provide attribute name.",
                              attribute_definition = "Please provide a brief definition of the attribute you are including.",
                              storage_type = "Please provide a storage type.",
                              measurement_scale = "Please provide a measurement scale.")
    stop(error_message, call. = FALSE)
  }
  
  attribute <- list(attributeName = attribute_name,
                    attributeDefinition = attribute_definition,
                    storageType = storage_type)
  
  if (!missing(attribute_label)) {
   attribute$attributeLabel <- attribute_label
  }
  
  if (measurement_scale == "nominal") {
    measurementScale <- create_nominal(domain = domain, 
                                    definition = definition,
                                    text_pattern = text_pattern) 
  }
  
  if (measurement_scale == "ordinal") {
    measurementScale <- create_ordinal(domain = domain, 
                                    definition = definition, 
                                    text_pattern = text_pattern)
  } 
  
  if (measurement_scale == "interval" | measurement_scale == "ratio") {
    measurementScale <- create_interval_ratio(type = type,
                                           units = units, 
                                           unit_precision = unit_precision, 
                                           number_type = number_type,
                                           minimum = minimum, 
                                           maximum = maximum)
  } 
  
  if (measurement_scale == "dateTime") {
    measurementScale <- create_datetime(date_time_format = date_time_format, 
                                     date_time_precision = date_time_precision,
                                     minimum = minimum, 
                                     maximum = maximum)
  }
  
  attribute$measurementScale <- measurementScale
  
  
  return(attribute) 
}
#' @title Create an Attribute in Nominal Measurement Scale 
#' @param domain Either "text" or "enumerated". 
#' @param definition If domain is "text", provide a word description of your attribute.
#' If the domain is "enumerated", provide a list of the attributes code definitions. 
#' @examples 
#' # Nominal(text):
#' \dontrun{create_attribute(attribute_name = "site_id",
#'                           attribute_definition = "Site id as used in sites table",
#'                           storage_type = EMLaide::storage_type$integer,
#'                           measurement_scale = EMLaide::measurement_scale$nominal,
#'                           domain= "text",
#'                           definition = "Site id as used in sites table.")}
#'
#' # Nominal(enumerated):
#' code_def_1 = list(code = "yes", definition = "has been captured previously")
#' code_def_2 = list(code = "no", definition = "has not been captured previously")
#' code_definition = list(code_def_1, code_def_2)
#' \dontrun{create_attribute(attribute_name = "Recap", 
#'                           attribute_definition = "Has the Turtle been captured and tagged previously",
#'                           storage_type = EMLaide::storage_type$text, 
#'                           measurement_scale = EMLaide::measurement_scale$nominal, 
#'                           domain = "enumerated",
#'                           definition = code_definition)}
#' @param text_pattern Optional. Only needed if applicable and the domain given is "text".
#' @keywords internal  
create_nominal <- function(domain = c("text", "enumerated"), definition, text_pattern = NULL) {
  
  if (is.null(domain)) {
    stop('Please provide a domain of "text" or "enumerated" and supply the remaining applicable inputs.', call. = FALSE)
  }
  domain <- match.arg(domain)
  
  if (is.null(definition)) {
    stop('Please provide the description for your measurement scale.', call. = FALSE)
  }
  measurementScale <- list(nominal = list(nonNumericDomain = list()))
  
  if (domain == "text") {
    measurementScale$nominal$nonNumericDomain$textDomain$definition <- definition
    
    if (!is.null(text_pattern)) {
      measurementScale$nominal$nonNumericDomain$textDomain$pattern <- text_pattern
    }
    
  } else {
    #enumerated 
    measurementScale$nominal$nonNumericDomain$enumeratedDomain <- definition
    } 
  return(measurementScale)
}
#' @title Create an attribute in Ordinal Measurement Scale 
#' @param domain Either "text" or "enumerated". 
#' @param definition If domain is "text", provide a word description of your attribute.
#' If the domain is "enumerated", provide a list of the attributes code definitions. 
#' Examples are seen in exported documentation. 
#' @examples 
#' # Ordinal(text):
#' \dontrun{create_attribute(attribute_name = "LatitudeDD", 
#'                           attribute_definition = "Latitude",
#'                           storage_type = EMLaide::storage_type$string,
#'                           measurement_scale = EMLaide::measurement_scale$ordinal,
#'                           domain= "text", 
#'                           definition = "Latitude")}
#'               
#' # Ordinal(enumerated): 
#' code_def_0 = list(code = "0", definition = "0 insects per meter of branch")
#' code_def_1 = list(code = "1", definition = "1-10 insects per meter")
#' code_def_2 = list(code = "2", definition = "11 – 100 insects per meter")
#' code_def_3 = list(code = "3", definition = "more than 100 insects per meter")
#' code_definition = list(code_def_0, code_def_1, code_def_2, code_def_3)
#' \dontrun{create_attribute(attribute_name = "hwa",
#'                           attribute_definition = "Hemlock woolly adelgid density per meter of branch",
#'                           storage_type = EMLaide::storage_type$decimal,
#'                           measurement_scale = EMLaide::measurement_scale$ordinal,
#'                           domain = "enumerated",
#'                           definition = code_definition)}
#' @param text_pattern Optional. Only needed if applicable and the domain given is "text".
#' @keywords internal
create_ordinal <- function(domain = c("text", "enumerated"), definition, text_pattern = NULL) {
  
  if (is.null(domain)) {
    stop('Please provide a domain of "text" or "enumerated" and supply the remaining applicable inputs.', call. = FALSE)
  }
  domain <- match.arg(domain)
  if (is.null(definition)) {
    stop('Please provide the description for your measurement scale.', call. = FALSE)
  }
  measurementScale <- list(ordinal = list(nonNumericDomain = list()))
  
  if (domain == "text") {
    measurementScale$ordinal$nonNumericDomain$textDomain$definition <- definition
    
    if (!is.null(text_pattern)) {
      measurementScale$ordinal$nonNumericDomain$textDomain$pattern <- text_pattern
    }
    
  } else {
    #enumerated 
    measurementScale$ordinal$nonNumericDomain$enumeratedDomain <- definition
  } 
  return(measurementScale)
}

#' @title Create an attribute in Interval or Ratio Measurement Scales
#' @param type Either "interval" or "ratio". Use "interval" to define 
#' data which consist of equidistant points on a scale. Use "ratio" to define data 
#' which consists not only of equidistant points but also has a meaningful zero 
#' point, which allows the ratio to have meaning.
#' @param units The units assigned to this attribute. 
#' @param unit_precision How precise this attirbutes' measurements are recorded. 
#' @param number_type What type of number. Examples given in exported documentation. 
#' @param minimum Optional. Theoretical or allowable minimum value. Values can be larger than 
#' or equal to this number. 
#' @param maximum Optional. Theoretical or allowable maximum value. Values can be less than 
#' or equal to this number.
#' @examples 
#' # Interval:
#' \dontrun{create_attribute(attribute_name = "Count",
#'                           attribute_definition = "Number of individuals observed",
#'                           measurement_scale = EMLaide::measurement_scale$interval, 
#'                           storage_type = EMLaide::storage_type$integer,
#'                           type = "interval",
#'                           units = "number",
#'                           unit_precision = "1",
#'                           number_type = EMLaide::number_type$whole, 
#'                           minimum = "0")}
#'                    
#' # Ratio: 
#' \dontrun{create_attribute(attribute_name = "pH",
#'                           attribute_definition = "pH of soil solution",
#'                           storage_type = EMLaide::storage_type$float,
#'                           measurement_scale = EMLaide::measurement_scale$ratio,
#'                           type = "ratio",
#'                           units = "dimensionless",
#'                           unit_precision = "0.01",
#'                           number_type = EMLaide::number_type$real)}
#' @keywords internal
create_interval_ratio <- function(type = c("interval", "ratio"), units,  
                               number_type, unit_precision = NULL, minimum = NULL, maximum = NULL) {
  
  required_arguments <- c("type", "units", "unit_precision", "number_type", "minimum", "maximum")
  missing_argument_index <- which(c(is.null(type), is.null(units), is.null(unit_precision), is.null(number_type),
                                  is.null(minimum), is.null(maximum)))
  
  if (length(missing_argument_index) > 0) {
    interval_error <- required_arguments[missing_argument_index][1]
    interval_error_message <- switch(interval_error, 
                                     type = "Please provide a type of 'interval' or 'ratio'.",
                                     units = "Please provide what units your measurement scale uses.",
                                     unit_precision = "Please provide what level of precision your measurements use.",
                                     number_type = "Please provide what type of numbers are being used.", 
                                     minimum = "Please provide a minimum theoretical value if applicable.",
                                     maximum = "Please provide a maximum theoretical value if applicable.")
    if (is.null(type) | is.null(units) | is.null(number_type)) {
      stop(interval_error_message, call. = FALSE)
    } 
  } 
  type <- match.arg(type)
  
  if (units %in% EMLaide::standard_units) {
    interval_ratio <- list(unit = list(standardUnit = units),
                           numericDomain =
                             list(numberType = number_type))
  } else {
    interval_ratio <- list(unit = list(customUnit = units),
                           numericDomain =
                             list(numberType = number_type))
    custom_units <- units
    print(paste("We identified the following custom unit:", custom_units, 
                ", please make sure to add information on this custom unit in additional metadata information:", 
                sep = " "))
  }
  if (is.null(unit_precision)) {
    warning(interval_error_message, call. = FALSE)
  } else {
    if (!is.na(unit_precision)) { 
    interval_ratio$precision <- unit_precision
    }
  }
  
  if (type == "interval") {
    measurementScale <- list(interval = interval_ratio)
  } else {
    measurementScale <- list(ratio = interval_ratio)
  }
  
  if (is.null(minimum)) {
    warning(interval_error_message, call. = FALSE)
  } else { 
    if (type == "interval") {
      measurementScale$interval$numericDomain$bounds$minimum <- list("exclusive" = "false",
                                                                     minimum = minimum) 
    } else {
      measurementScale$ratio$numericDomain$bounds$minimum <- list("exclusive" = "false",
                                                                  minimum = minimum)
    } 
  }
  
  if (is.null(maximum)) {
    warning(interval_error_message, call. = FALSE)
  } else { 
    if (type == "interval") {
      measurementScale$interval$numericDomain$bounds$maximum <- list("exclusive" = "false",
                                                                     maximum = maximum) 
    } else {
      measurementScale$ratio$numericDomain$bounds$maximum <- list("exclusive" = "false",
                                                                  maximum = maximum)
    } 
  }
  return(measurementScale)
}

#' @title Create an attribute in dateTime Measurement Scale 
#' @param date_time_format ISO 8601 format should be used. 
#' @param date_time_precision To what level of time your attribute is recorded. 
#' @param minimum The earliest dateTime recorded. Values can be larger than 
#' or equal to this number. 
#' @param maximum The latest dateTime recorded. Values can be less than 
#' or equal to this number. 
#' @examples 
#' \dontrun{create_attribute(attribute_name = "Yrs",
#'                           attribute_definition = "Calendar year of the observation from years 1990 - 2010.",
#'                           storage_type = EMLaide::storage_type$integer,
#'                           measurement_scale = EMLaide::measurement_scale$dateTime,
#'                           attribute_label = "Years",
#'                           date_time_format = "YYYY", 
#'                           date_time_precision = "1", 
#'                           minimum = "1993", 
#'                           maximum = "2003")}
#' @keywords internal
create_datetime <- function(date_time_format, date_time_precision, minimum, maximum) {
  
  required_arguments <- c("date_time_format", "date_time_precision", "minimum", "maximum")
  missing_argument_index <- which(c(is.null(date_time_format), is.null(date_time_precision),
                            is.null(minimum), is.null(maximum)))
  
  if (length(missing_argument_index) > 0) {
    dt_error <- required_arguments[missing_argument_index][1]
    dt_error_message <- switch(dt_error,
                               date_time_format = "Please provide the correct format of which your date time attribute is in.",
                               date_time_precision = "Please provide the level of precision your date time attribute has.",
                               minimum = "Please provide the earliest date time used.",
                               maximum = "Please provide the latest date time used.")
    stop(dt_error_message, call. = FALSE)
  } 
  
  measurementScale <- list(dateTime = 
                             list(formatString = date_time_format, 
                                  dateTimePrecision = date_time_precision,
                                  dateTimeDomain = 
                                    list(bounds = 
                                           list(minimum = list("exclusive" = "false",
                                                               minimum = minimum),
                                                maximum = list("exclusive" = "false",
                                                               maximum = maximum)))))
  return(measurementScale)
}
  
  
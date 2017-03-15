#' <Rhm_Base>
#'
  #' <Crea un hihgmap base>
#'
#' @import htmlwidgets
#' @param mapjson Una lista organizada en una FeatureColection frecuentemente proveniente de un mapa "json".
#' @param datos Un data.frame de dos columnas. En la primera de las cuales estó el código de homologación de los datos. 
#' Este código debe de estar contenido en las propiedades de las Features en mapjson. La segunda columna contiene
#' los datos que se asignan a cada feature.
#' @param jscode Es el nombre de la propiedad de las features con las que se homologa el código en datos.
#' @param mapname Nombre que se mostrara en los mapas.
#' @param title Titulo del mapa.
#' @param popcolor Color para resaltar mapa, en valor hexadecimal.
#' @param mapcolor Color general de mapa, en valor hexadecimal.
#' @param dataname Nombre de la serie de datos.
#' @param porname Nombre de los datos mostrados.
#' @param popvalue Dato para mostrar en el pop.
#' @param width Ancho.
#' @param height Alto.
#' @param elementId Identificador del elemento.
#' @export

rhm_base <- function(mapjson,datos, 
                     jscode,
                     #datcode="code",
                     #keyvalue="value",
                     mapname=jscode,
                     title="MAPA",
                     popcolor='#a4edba',
                     mapcolor="#770eff",
                     dataname="Data",
                     popname=jscode,
                     popvalue="value",
                     width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    mapjson= mapjson,
    data=RdataToJS(datos),
    jscode=jscode,
    #datcode=datcode,
    #keyvalue=keyvalue,
    mapcolor=mapcolor,
    mapname=mapname,
    title=title,
    dataname=dataname,
    popname=popname,
    popvalue=popvalue,
    popcolor=popcolor
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'rhm_base',
    x,
    width = width,
    height = height,
    package = 'RHighmaps',
    elementId = elementId
  )
}

#' Shiny bindings for rhm_base
#'
#' Output and render functions for using rhm_base within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a rhm_base
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name rhm_base-shiny
#'
#' @export
rhm_baseOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'rhm_base', width, height, package = 'RHighmaps')
}

#' @rdname rhm_base-shiny
#' @export
renderRhm_base <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, rhm_baseOutput, env, quoted = TRUE)
}



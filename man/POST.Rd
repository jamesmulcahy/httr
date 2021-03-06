\name{POST}
\alias{POST}
\title{POST file to a server.}
\usage{
  POST(url = NULL, config = list(), body = NULL,
    multipart = TRUE, ..., handle = NULL)
}
\arguments{
  \item{body}{Use \code{NULL} for an empty body, a
  length-one character or file. Each component should
  either be a character value or the object returned by
  \code{\link[RCurl]{fileUpload}} (if you want to upload a
  file).  If \code{multipart} is \code{FALSE} elements will
  be escaped automatically - if the values have already
  been escaped, then use `I` to prevent double-escaping.}

  \item{multipart}{Should the form be send as
  multipart/form-data (\code{TRUE}), or
  application/x-www-form-urlencoded (\code{FALSE}).  Files
  can not be uploaded when \code{FALSE}.}

  \item{url}{the url of the page to retrieve}

  \item{config}{Additional configuration settings such as
  http authentication (\code{\link{authenticate}}),
  additional headers (\code{\link{add_headers}}), cookies
  (\code{\link{set_cookies}}) etc.  See
  \code{\link{config}} for full details and list of
  helpers.}

  \item{...}{Further parameters, such as \code{query},
  \code{path}, etc, passed on to \code{\link{modify_url}}.
  These parameters must be named.}

  \item{handle}{The handle to use with this request. If not
  supplied, will be retrieved and reused from the
  \code{\link{handle_pool}} based on the scheme, hostname
  and port of the url. By default \pkg{httr} requests to
  the same scheme/host/port combo. This substantially
  reduces connection time, and ensures that cookies are
  maintained over multiple requests to the same host. See
  \code{\link{handle_pool}} for more details.}
}
\description{
  POST file to a server.
}
\examples{
b <- new_bin()
POST(b)
POST(b, body = "A simple text string")
POST(b, body = list(a = 1, b = 2, c = 3))
POST(b, body = list(a = 1, file = upload_file(system.file("CITATION"))))

b2 <- "http://httpbin.org/post"
POST(b2, body = "A simple text string")
POST(b2, body = list(x = "A simple text string"))
POST(b2, body = list(y = upload_file(system.file("CITATION"))))
}


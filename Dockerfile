FROM rocker/r-ver:4.0.2
LABEL maintainer="francisco"
RUN ["install2.r", "googleAuthR", "googleCloudStorageR"]
WORKDIR /payload/
COPY ["R/", "R/"]
COPY ["token/", "token/"]
CMD ["R", "--vanilla", "-f", "R/02_schedule.R"]

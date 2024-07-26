FROM rocker/shiny:latest

# Install necessary R packages
RUN R -e "install.packages(c('shiny', 'bslib'), repos='http://cran.rstudio.com/')"

# Copy the Shiny app code to the image
COPY app.R /srv/shiny-server/

# Set the working directory
WORKDIR /srv/shiny-server/

# Expose the port for the Shiny app
EXPOSE 3838

# Run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server', host = '0.0.0.0', port=3838)"]

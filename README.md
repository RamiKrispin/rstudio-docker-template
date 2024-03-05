# RStudio Docker Template

🚧WIP 🏗️, pre spell checking🛠️

The repository provides a template for launching an RStudio Server in a container with the local RStudio settings (i.e., code snippets, color theme, environment variables, etc.). The template leverages the [Rocker Project](https://rocker-project.org/) built-in RStudio image with an additional customization layer.


<br>
<figure>
 <img src="images/rstudio.png" width="100%" align="center"/></a>
</figure>
</br>


## Settings

This repository has the following structure:

```shell
.
├── README.md
├── docker
│   ├── Dockerfile
│   ├── build_image.sh
│   ├── install_packages.R
│   ├── packages.json
│   └── set_dependencies.sh
└── docker-compose.yml
```

The `docker` folder contains the docker template for adding new packages and the `docker-compose.yml` file has the RStudio container launch settings.


## Launching RStudio with Docker Compose

The `docker-compose.yml` file provides a concise form for the below `docker run` command:


```shell
docker run --rm -ti \
-v .:/home/rstudio \
-v $HOME/.config/rstudio:/home/rstudio/.config/rstudio \
-v $HOME/.Renviron:/home/rstudio/.Renviron \
-e PASSWORD=password \
-p 8787:8787 rocker/rstudio
```

This includes the following functionality:
- Launching the Rocker container - `rocker/rstudio:4.3.2` in an interactive mode
- Mount the local folder to the container home folder
- Mount the local RStudio settings and `.Renviron` file
- Set the login password as a `password`. By default, the login username is `rstudio`
- Map the local port `8787` with the container exposed port - `8787` 


`docker-compose.yml`
``` yaml
version: "3.9"
services:
  rstudio:
    image: "rocker/rstudio:4.3.2"
    ports:
      - "8787:8787"
    volumes:
      - type: "bind"
        source: "."
        target: "/home/rstudio"
      - type: "bind"
        source: "$HOME/.config/rstudio"
        target: "/home/rstudio/.config/rstudio"
      - type: "bind"
        source: "$HOME/.Renviron"
        target: "/home/rstudio/.Renviron"
    environment:
      - PASSWORD=yourpassword
```

**Note:** This docker-compose setting mounts the local folder to the container. You can customize it by modifying the `source` argument under the first `bind` section to the preferred folder path.

## Customize the Image

The docker folder provides the settings for building an image on top of the rocker/rstudio image. This enables you to customize your environment and add additional libraries and other dependencies. This includes the following files:
- `build_image.sh` - a Bash script to build and push the image
- `set_dependencies.sh` - a Bash script that installs the image dependencies during the build time. This includes leveraging the following scripts:
    - `install_packages.R` - an R script to install R packages during the image build time
    - `packages.json` - a JSON file with the list of packages and their versions to install by the `install_packages.R` file

To build the image you will need have [jq](https://jqlang.github.io/jq/) installed to parse the JSON file. 


The `build_image.sh` script has one argument - the image name. For example, the below code will build and name the image as `rkrispin/rstudio-customize:dev`:

```shell
bash build_image.sh rkrispin/rstudio-customize:dev
```

## Resources

- Running RStudio Inside a Container - TBD
- RStudio - https://posit.co/products/open-source/rstudio/
- The Rocker Project - https://rocker-project.org/


## License

This template is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/) License.



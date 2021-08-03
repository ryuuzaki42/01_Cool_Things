    ## Python3 ##

## python3 simple HTTP server
    cd path/to/share/

    python3 -m http.server

    ## Start in the folder that run the command

    ## Localhost:
        http://localhost:8000

    ## Other machine in same network:
        http://<IP>:8000

        # ex:
        http://192.168.0.105:8000/

## Create virtual environment
    # https://docs.python.org/3/tutorial/venv.html

    ## Create a virtual environment in local path with name my-env
        python3 -m venv my-env

    ## Now activate it.
        ## On Windows
            my-env\Scripts\activate.bat

        ## On Unix or MacOS
            source my-env/bin/activate

    ## To deactivate
        deactivate

        ## On conda
            conda deactivate

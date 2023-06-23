    ## Python3 ##

## python3 simple HTTP server
    # https://docs.python.org/2/library/simplehttpserver.html
    # https://docs.python.org/3/library/http.server.html

    ## Start in the folder want to share
        cd path/to/share/

    ## Print local IP
        /sbin/ifconfig | grep broadcast | awk '{print $2}'

    ## Create server
        python3 -m http.server

        ## Or
            python3 -m http.server --help

            python3 -m http.server [port]

    ## Localhost:
        http://localhost:8000

    ## On other machine in same network:
        http://<IP>:8000

        # ex:
        http://192.168.0.105:8000/

## Create virtual environment
    # https://docs.python.org/3/tutorial/venv.html

    ## Create a virtual environment in local path with name my-env
        python3 -m venv my-env

    ## Now activate it, use environment name
        ## On Windows
            my-env\Scripts\activate.bat

        ## On Unix or MacOS
            source my-env/bin/activate

    ## To deactivate
        deactivate

        ## On conda
            conda deactivate

    ## To install lib
        ## Install pillow
            pip install pillow

    ## pip cache info
        pip cache info

    ## pip clean cache
        pip cache purge

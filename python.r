
    ## Python3 ##

#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Last update: 16/06/2024
#

## python3 simple HTTP server
    # https://docs.python.org/2/library/simplehttpserver.html
    # https://docs.python.org/3/library/http.server.html

    ## Start in the folder want to share
        cd path/to/share/

    ## Print local IP
        /sbin/ifconfig | grep broadcast | awk '{print $2}'

    ## Create server - python3
        python3 -m http.server

        ## Or
            python3 -m http.server --help

            python3 -m http.server [port]

            ## Old - python2
            python -m SimpleHTTPServer

            python -m SimpleHTTPServer [port]

    ## Access
        ## Localhost:
            http://localhost:8000

            http://0.0.0.0:8000/

            http://127.0.0.1:8000

            http://<IP_Address>:8000

        ## On other machine in same network:
            http://<IP>:8000

            ## ex:
                http://192.168.0.105:8000/
        ## Print link with default port
            echo "http://$(/sbin/ifconfig | grep broadcast | awk '{print $2}'):8000/"

## Create virtual environment
    # https://docs.python.org/3/tutorial/venv.html

    ## Create a virtual environment in local path with name my_env
        python3 -m venv my_env

    ## Now activate it, use environment name
        ## On Windows
            my_env\Scripts\activate.bat

        ## On Unix or MacOS
            source my_env/bin/activate

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

## pip upgrade packages
    ## List outdated
        pip list --outdated

        ## upgrade
            pip install [package] --upgrade

## Install howdoi # Install pip before
    pip install howdoi

    ## Upgrade howdoi
        # pip install [package] --upgrade
        pip install howdoi --upgrade

## Install packages requirements
    pip install -r requirements.txt

## Upgrade all pip packages
    pip freeze > requirements.txt

    pip install -r requirements.txt --upgrade

## Python3
    https://github.com/arbackes/Livro_Python
    https://www.w3schools.com/python/default.asp
    https://python.swaroopch.com/

    ## x^y - 4^9 - elevado / power
        4**9
            = 262144

    ## int limit
        5**262144
            ## ValueError: Exceeds the limit (4300) for integer string conversion; use sys.set_int_max_str_digits() to increase the limit

        import sys
        sys.set_int_max_str_digits(0)
        5**262144
            = 620606987866087...

    ## int to string
        a = 5**262144
        b = str(a)

        len(b)
            = 183231

        ## Or
            len(str(a))

    ## end and sep
        print("Hello World", end="\n")
        print("Hello World", end=" ")
        print("Hello World", end="")
        print('30','11','2023', sep='/', end='\n')

        name = "Alice"
        age = 30
        print("My name is", name, "and I am", age, "years old.", end=" ")

    ## print format
        print("My name is {} and I am {} years old.".format(name, age))
        print("My name is {} and I am {} years old.".format("John", age), end="\n\n")

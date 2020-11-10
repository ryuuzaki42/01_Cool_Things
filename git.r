## Git commands ##

## Describe how you plan to use GitHub
    # https://www.quora.com/How-do-you-plan-to-use-GitHub

    I aim to make use of Github in the following ways:

    1 Showcase my work: Github is a great way for me to showcase my work to the world, and to allow others to contribute to my work as well.
    The world, especially in tech, is moving towards emphasizing people’s skills and their abilities over academic credentials when it comes
    to recruiting, so it’s a great way for me to showcase my real-world coding experience.

    2 Make open-source contributions: There are a lot of cool and impactful open-source contributions on Github. I aspire to contribute to
    open-source projects in areas of my interest, which are currently machine learning and statistics. This is not only a great way for me to
    hone my skills, but is also a way for me to push my field of interest forward. For example, I want to contribute to Python packages such as
    scikit-learn (for Machine Learning) and statsmodels (for Statistics).

    3 Collaborate with project partners: Github is great for collaborating with others on my projects. For eg, if a bunch of friends and I are working
    on a side project, I’d want to use Github to collaborate with them. It’s very easy to synchronize progress using Github when working with a team.

    4 Access interesting but less well-known open-source contributions: There are a lot of nascent open-source contributions that have proven to be
    immensely useful in my research and side projects. Examples are: a sentence2vec implementation, and a tool to create interactive t-SNE visualizations

    5 Create impactful open-source projects: I strongly aspire to create high impact open-source projects in my areas of interest. For example, it is my
    ambition to create an equivalent (and hopefully, even better version) of ggplot (a wonderful visualization package for R) in Python, which would be
    extremely useful for data scientists who work primarily in Python. (Note: If you are inspired to work on such a project as well, please do let me know).

## Good links
    http://git-scm.com/book/
    https://leanpub.com/pro-git/read

## Git configurações
    git config --global user.email "your_email@example.com"
    git config --global user.name "your_email_name"

## Inicar git no diretório atual
    git init

## Adicionar arquivo(s) ao gerenciamento do git
    # Adiciona o arquivo.extensão ao gerenciamento do git
    git add arquivo.extensão

    ## Adiciona todos os arquivos com extensão txt ao gerenciamento do git
        git add *.txt

    ## Adiciona todos os arquivos com nome file ao gerenciamento do git
        git add file.*
        # Váriadas combinações com com ? e * podem ser usadas
        # use rm em vez de add para remover arquivo(s)

    ## Adiciona todos os arquivos
        git add .

## Enviar mudanças (commit)
    git commit -m "commit name"

    ## Commit com todas mudanças e adiciona novos arquivos ao gerenciamento do git (git add .)
        git commit -am "commit name"

## Visualizar mudanças em arquivos antes do commit
    git diff
    # Suporte a diff em apenas um arquivo
        git diff file.ext

## Git configuração de visualização de diffs
    # Avoid escape characters in GIT >> ESC (http://michael.otacoo.com/linux-2/avoid-escape-characters-in-git/)
    git config --global core.pager more

## Exibir configurações do usuário
    git config --list

## Status geral do repositório
    git status

## Histórico de commints
    git log

## Diferença entre o repositório git e stage area
    git diff --staged

## Remover arquivos do repositório depois de adicionar no .gitignore | Untracked files
    git rm -r --cached .
    git add .
    git commit -am "Remove ignored files"

## Renomear arquivos e manter eles rastreados
    # Step1: rename the file from oldfile to newfile
    git mv oldfile newfile

    # Step2: git commit and add comments
    git commit -m "rename oldfile to newfile"

## Visualizar mudanças em arquivo em função de palavras # diff by word
    git diff --word-diff

## Mostrar branch
    git show-branch -a
    # or
    git branch -a

## Enviar commit
    git push origin master

## Verificar se o repositório remoto está mais atualizado que o local
    ## Para atualiza a lista de commits do repositório remoto
    git remote update

    ## Para verficar os commits
    git status
    # git status -uno

    ## Ver mudanças
    git diff origin/master

    ## Download das modificações e faz o merge
    # teste
    git pull --dry-run
    # run
    git pull

    ## Download das modificações e NÃO faz o merge
    git fetch

## Mostra os arquivos que não estão sendo rastreados (uso do .gitignore)
    git status --ignored --untracked-files=all

## cleanup unnecessary files and optimize the local repository
    git gc
    #or
    git gc --aggressive

## Adicione um repositório remoto
    # git remote add origin https://github.com/ryuuzaki42/0txt.git
    # origin is just the commum name for the link config
    git remote add origin link

## Clone one repository
    git clone link-repository

## Clone a specific Git branch
    git clone -b <branch> <remote_repo>

## Delete files from history
    # https://help.github.com/articles/remove-sensitive-data/
    # https://rtyley.github.io/bfg-repo-cleaner/

    ## bfg
        ## bfg with out install
            java -jar /pahtFolder/bfg-*.jar
        ## bfg installed
            bfg

    1) Delete the file or folder
        ## Delete file: "-D" or "--delete-files" (* glob)
            bfg -D fileName*fileExt /pahtGitRep/

        ## Delete folder: --delete-folders (* glob)
            bfg --delete-folders folderName* /pahtGitRep/

    ## Commit blocked? => --no-blob-protection
        bfg -D fileName*fileExt /pahtGitRep/ --no-blob-protection

    2) ## The file/folder will be not deleted form the gitRep, so delete them
        rm fileName*fileExt
        #or
        rm -r folderName*

    3) ## Git will keep tracking the files, so remove them from track files
        git rm -r --cached .
        git add .

    4) ## Remote repository will reject the commit push, so --force --all
        git push origin --force --all

## Big files on git use lfs
    # https://git-lfs.github.com/

    # Download and install lfs (https://github.com/github/git-lfs/releases)
    # git lfs install

    ## Select the file types you'd like Git LFS to manage (or directly edit your .gitattributes)
    git lfs track fileName.ext

    #or
    git lfs track "*.psd"

    ## There is no step three. Just commit and push to GitHub as you normally would
    git add file.psd
    git commit -m "Add design file"
    git push origin master

    ## To clone mirror with lfs
        ## Setup Git LFS on your system. You only have to do this once per repository per machine:
            git lfs install

            git clone <repo-with-lfs>

## Smartgit get userName form ".git/config"
    ## Change url = site/userName/repo
    url = https://github.com/ryuuzaki42/0txt.git
    ## to url = userName@site/userName/repo
    url = https://ryuuzaki42@github.com/ryuuzaki42/0txt.git

## Git in two repository
    ## Add a new url
    url = https://ryuuzaki42@bitbucket.org/ryuuzaki42/0txt.git
    url = https://github.com/ryuuzaki42/0txt.git

## Git gc "cleanup unnecessary files and optimize the local repository"
    ## Do not use "git clean" => Which will delete untracked files from your tree

    git gc --help
        --aggressive
            # Usually git gc runs very quickly while providing good disk space utilization and performance.
            # This option will cause git gc to more aggressively optimize the repository at the expense of taking much more time.
            # The effects of this optimization are persistent, so this option only needs to be used occasionally; every few hundred changesets or so.

        --auto
            # With this option, git gc checks whether any housekeeping is required; if not, it exits without performing any work.
            # Some git commands run git gc --auto after performing operations that could create many loose objects.

    git gc --aggressive
    git gc --auto
    git gc

    ## All folder in one directory run "git gc --aggressive"
    for folderGit in `ls`; do echo -e "\nRunning \"git gc --aggressive\" inside: \"$folderGit/\"\n"; cd $folderGit; git gc --aggressive; cd ..; done

    ## All folder in one directory run "git gc --auto"
    for folderGit in `ls`; do echo -e "\nRunning \"git gc --auto\" inside: \"$folderGit/\"\n"; cd $folderGit; git gc --auto; cd ..; done

    ## All folder in one directory run "git gc"
    #comandGitRun="git gc"; for folderGit in `ls`; do echo -e "\nRunning \"git gc\" inside: \"$folderGit/\"\n"; cd $folderGit; $comandGitRun; cd ..; done

    for folderGit in `ls`; do echo -e "\nRunning \"git gc\" inside: \"$folderGit/\"\n"; cd $folderGit; git gc; cd ..; done

## Show all users and the number of commits
    git shortlog -sn

## Changing author info - https://help.github.com/articles/changing-author-info/
    ## 1 - Create a fresh, bare clone of your repository:
        git clone --bare https://github.com/user/repo.git
        cd repo.git

    ## 2 Copy and paste the script, replacing the following variables based on the information you gathered:
        OLD_EMAIL
        CORRECT_NAME
        CORRECT_EMAIL

        #!/bin/sh
        git filter-branch --env-filter '
        OLD_EMAIL="your-old-email@example.com"
        CORRECT_NAME="Your Correct Name"
        CORRECT_EMAIL="your-correct-email@example.com"
        if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
        then
            export GIT_COMMITTER_NAME="$CORRECT_NAME"
            export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
        fi
        if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
        then
            export GIT_AUTHOR_NAME="$CORRECT_NAME"
            export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
        fi
        ' --tag-name-filter cat -- --branches --tags

    ## 3 Push the corrected history to GitHub
        git push --force --tags origin 'refs/heads/*'

    ## 4 Clean up the temporary clone:
        cd ..
        rm -rf repo.git

## Search for a deleted file
    git log --all --full-history -- **/thefile.*

    ## If you know the path:
        git log --all --full-history -- <path-to-file>

## Find/Identify large files in git history
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| awk '/^blob/ {print substr($0,6)}' \
| sort --numeric-sort --key=2b

    ## Output for Humans
git rev-list --objects --all \
| git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
| awk '/^blob/ {print substr($0,6)}' \
| sort --numeric-sort --key=2b \
| cut --complement --characters=8-40 \
| numfmt --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest

## Git show remote URL
    git config --get remote.origin.url


## Add gpg sign key in commits by the IDE Smartgit
    # https://help.github.com/articles/signing-commits-with-gpg/

    ## List keys
        gpg --list-secret-keys --keyid-format LONG

    ## Generate a new key
        gpg --gen-key
        # insert the data: name, e-mail and comment.

    ## See public part of the key
        gpg --armor --export KEYID
        # -----BEGIN PGP PUBLIC KEY BLOCK-----
        # ...
        # -----END PGP PUBLIC KEY BLOCK-----

     ## Add key in github
     # https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/
     # https://gist.github.com/ryuuzaki42/da8e953d4a7664d6dea445a3d5a5aa6d
        get public part and add in settings

    ## Set git to use gpg key
        ## Set up Git to auto-sign all commits
            git config --global commit.gpgsign true

            git config --global user.signingkey KEYID

        ## Set up Git to use gpg2 (smartgit needed)
            git config --global gpg.program "/usr/bin/gpg2"

        ## Disable TTY if you have problems with making auto-signed commits from your IDE or other software
            echo 'no-tty' >> ~/.gnupg/gpg.conf

        ## Git configuration file result (/home/$USER/.gitconfig)
            [user]
                ..
                signingkey = KEYID
                ...
            [commit]
                gpgsign = true
            [gpg]
                program = /usr/bin/gpg2

        ## Smartgit
            Select a repository -> settings
                See if GPG Program and Signing Key are set

         ## Final result
            A commit in GitHub:
                [ Verified ]
                    This commit was signed with a verified signature

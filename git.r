## Git commands ##

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

## Smartgit get userName form ".git/config"
    ## Change url = site/userName/repo
    url = https://github.com/ryuuzaki42/0txt.git
    ## to url = userName@site/userName/repo
    url = https://ryuuzaki42@github.com/ryuuzaki42/0txt.git

## Git in two repository
    ## Add a new url
    url = https://ryuuzaki42@bitbucket.org/ryuuzaki42/0txt.git
    url = https://github.com/ryuuzaki42/0txt.git

## Git gc
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
    for folderGit in `ls`; do echo -e "\nRunning \"git gc --aggressive\" inside: $folderGit\n"; cd $folderGit; git gc --aggressive; cd ..; done

    ## All folder in one directory run "git gc --auto"
    for folderGit in `ls`; do echo -e "\nRunning \"git gc --auto\" inside: $folderGit\n"; cd $folderGit; git gc --auto; cd ..; done

    ## All folder in one directory run "git gc"
    #comandGitRun="git gc"; for folderGit in `ls`; do echo -e "\nRunning \"git gc\" inside: $folderGit\n"; cd $folderGit; $comandGitRun; cd ..; done

    for folderGit in `ls`; do echo -e "\nRunning \"git gc\" inside: $folderGit\n"; cd $folderGit; git gc; cd ..; done

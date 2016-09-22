## Links
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

## Remover arquivos do repositório depois de adicionar no .gitignore
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

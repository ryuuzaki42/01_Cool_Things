## Windows do ##

## Windows não reconhece partição (NTFS) conectada.
    # open a command prompt (cmd) as adminstrator:
    1) diskpart
    2) list volume

    # You saw that all volumes
    3) select volume x (where x is the number of the offline volume)
    4) online volume

    # So you this volumes again online
    5) assign letter=R
    #Now you set a letter for mount, change R for the one letter available

## Desabilitar windows update

## Desabilitar hibernate
    powercfg.exe /hibernate off

    # Voltar ao padrão
        powercfg.exe /hibernate on

## Desabilitar efeitos de aparência

## Desabilitar backup

## Instalar Microsoft office, CCleaner

## Get the motherboard from CMD
    # Descobrir a placa-mãe através do CMD
    wmic baseboard get product,manufacturer

## Habilitar F8 (boot legacy com opções uteis) no Windows 10
    bcdedit /set bootmenupolicy legacy

    # Voltar ao padrão
        bcdedit /set bootmenupolicy standard

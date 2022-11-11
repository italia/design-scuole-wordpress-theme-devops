# ![developers.italia](https://avatars1.githubusercontent.com/u/15377824?s=36&v=4 "developers.italia") Design Scuole Italia DevOps
[![Join the #design siti scuole channel](https://img.shields.io/badge/Slack%20channel-%23design_siti_scuole-blue.svg)](https://developersitalia.slack.com/messages/design-siti-scuole/)

## Obiettivo del Progetto

- fornire strumenti per facilitare lo sviluppo, il test ed il deploy del tema “Design Scuole Italia”
- rendere disponibili immagini OCI di test
- collaborare con i progetti correlati per validare ed automatizzare i rilasci

## Strumenti DevOps per facilitare l'adozione di Wordpress con il tema “Design Scuole Italia”

[Design Scuole Italia](https://github.com/italia/design-scuole-wordpress-theme) è il tema WordPress che permette di aderire al [modello di sito istituzionale delle scuole](https://designers.italia.it/modello/scuole/), progettato dal Dipartimento per la trasformazione digitale in collaborazione con il Ministero dell’Istruzione.

## 🚨 Avvertenza

Il progetto è in fase embrionale, si consiglia di eseguire i passi su una macchina virtuale di test.

## Pre-requisiti

- Un sistema debian 11 con git e docker-compose
o 
- Un sistema con git e vagrant installato

## Installazione

Clonare il repository del progetto:

``` sh
git clone https://github.com/italia/design-scuole-wordpress-theme-devops
cd design-scuole-wordpress-theme-devops
```

Nel caso si voglia isolare l'ambiente con vagrant:

``` sh
vagrant up
vagrant ssh
cd /vagrant
```

Per avere a disposizione un ambiente di test con il tema installato:

``` sh
./bin/aio-base-install
./bin/aio-theme-install
```

Probabilmente sarà necessario uscire e rientrare (logout/login) per rendere
effettivo l'aggiunta del gruppo `docker`, per lanciare docker senza essere root.

Il sito sarà raggiungibile all'indirizzo http://localhost:8080 anche dalla
macchina host.

Il sito è configurato con utente `test` e password random (che si intravede
nell'output). In caso può essere cambiata al volo con:

``` sh
docker-compose run cli wp user update test --user_pass="unapasswordsicura"
```

## Esecuzione test suite **App di valutazione dell'adesione ai modelli**

La [test suite](https://github.com/italia/pa-website-validator) non è ancora
distribuita come immagine container, lo script `aio-test-install-debian`
installa le dipendenze necessarie in un sistema debian 11.

``` sh
./bin/aio-test-install-debian
./bin/aio-test-run
```

Nella home utente si troverà il report della app di valutazione in formato html
e json.

# Contribuire

Ogni suggerimento e proposta di integrazione sono benvenuti, in maniera simile
al progetto del tema:
https://github.com/italia/design-scuole-wordpress-theme/blob/main/CONTRIBUTING.md

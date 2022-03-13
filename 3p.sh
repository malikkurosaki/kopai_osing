#!/usr/bin/env bash

help() {
    echo "$(tput setaf 3)
   Usage: $0 [options]
   Options: 
        -h,     help        memunculkan menu ini
        -db,    database    mengedit setingan database
        -v,      version    melihat versi aplikasi

    Contoh:
        ./project -db
   $(tput sgr0)"
}

perintah() {
    case $1 in
    -db)
        editDb() {
            inf="$(tput setaf 6)Halo Fery!, Mau Edit Database Ya?
        \nTolong Lengkapi Data Dibawah Ini (isi lalu tekan enter)
        \n
        $(tput sgr0)"

            echo -e $inf | sed -e "s/ *$//"

            read -p "Nama Database: " db
            read -p "User: " user
            read -p "Password: " password
            read -p "Port: " port
            read -p "Host: " host

            valid="$(tput setaf 6)
        \nNama Database: $db
        \nUser         : $user
        \nPassword     : $password
        \nPort         : $port
        \nHost         : $host
        \n
        $(tput sgr0)"

            echo -e $valid | sed -e "s/ *$//"
            read -p 'apakah data diatas ini sudah benar (y/n) ?' benar
            if [[ $benar == "y" ]]; then
                env=DATABASE_URL="sqlserver://$host:$port;database=$db;user=$user;password=$password;encrypt=false;trustServerCertificate=true;"
                echo "$env" >.env
                echo "$(tput setaf 3)setingan database telah diperbarui, silahkan restart server , terimakasih$(tput sgr0)"

            else
                editDb
            fi
        }
        editDb

        ;;
    -v) echo "v0001" ;;
    -fi)
        cd kopai_osing
        flutter pub add qr_code_dart_scan
        flutter pub add pretty_qr_code
        flutter pub add get
        flutter pub add get_storage
        flutter pub add flutter_easyloading
        flutter pub add responsive_builder
        ;;
    -b) 
        cd kopai_osing 
        flutter build web --release --web-renderer html
    ;;
    *)
        echo "$1 db"
        ;;
    esac
}

if [[ ! -z $1 ]]; then
    perintah $1 $2
else
    help
fi

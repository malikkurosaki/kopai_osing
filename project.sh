#!/usr/bin/env bash

help() {
    echo "$(tput setaf 3)
   Usage: $0 [options]
   Options: 
        -h,     help            memunculkan menu ini
        -v,     version         melihat versi aplikasi
        -fi,    flutter init    install package yang dibutuhkan sekaligus
        -b,     flutter build   build flutter app web release
        -pub,   flutter pub     
        -r,     run             menjalankan aplikasi
            chrome              menjalankan aplikasi di chrome
            server              menjalankan server

    Contoh:
        ./project -h
   $(tput sgr0)"
}

perintah() {
    case $1 in
    -coba)
        test="
                nama
            malik
                    siapa
                    ini
                    coba
        "
        data=$(node server/util.js "$test")
        echo -e "$data"
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
        sudo \cp -r build/web/* ../server/views
        cd ..
        ls
        ;;
    -r)
        case $2 in
        chrome)
            cd kopai_osing
            flutter run -d chrome --web-renderer html --web-port 8000
            ;;
        server)
            cd server
            nodemon .
            cd ..
            ;;

        *) echo "chrome | server" ;;
        esac
        ;;
    -spl)
        cd kopai_osing
        flutter pub run flutter_native_splash:create
        ;;
    -si)
        cd server
        touch index.js
        npm init -y
        npm i express
        npm i express-async-handler
        npm i @prisma/client
        npm i cors
        mkdir -p views
        echo "
        const express = require('express');
        const app = express();
        const cors = require('cors');
        const PORT = process.env.PORT || 3000;
        app.use(cors());
        app.use(express.json());
        app.use(express.urlencoded({ extended: true }));
        app.use(express.static('views'));
        app.listen(PORT, () => {
            console.log($(Server is running on port ${PORT}));
        });
        " >index.js
        cd ..
        ;;
    -pub)
        case $2 in
        add)
            cd kopai_osing
            flutter pub get $3
            ;;
        get)
            cd kopai_osing
            flutter pub get
            ;;
        clean)
            cd kopai_osing
            flutter pub cache clean
            flutter clean
            ;;
        *) echo "add | get | clean" ;;
        esac
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

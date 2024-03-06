# setup.sh
#!/bin/bash

mkdir nodejs && cd nodejs
npm init -y
npm install express jsonwebtoken cors crypto-js argon2
cd ..
zip -r nodejs.zip nodejs
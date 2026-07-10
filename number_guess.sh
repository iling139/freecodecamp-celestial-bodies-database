#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Menghasilkan angka acak antara 1 dan 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Meminta input username
echo "Enter your username:"
read USERNAME

# Ambil user_id berdasarkan username
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# Cek apakah pengguna sudah pernah terdaftar
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Memasukkan user baru ke database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # Ambil kembali user_id yang baru dibuat
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Ambil total permainan dan tebakan terbaik jika pengguna sudah terdaftar
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Meminta tebakan pertama
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Inisialisasi penghitung jumlah tebakan
GUESS_COUNT=1

# Perulangan hingga tebakan benar
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
  # Validasi apakah input BUKAN merupakan integer
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read USER_GUESS
    continue
  fi

  # Tambah hitungan tebakan jika inputnya valid berupa angka
  ((GUESS_COUNT++))

  # Cek apakah tebakan lebih besar atau lebih kecil
  if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  
  # Ambil input baru untuk tebakan selanjutnya
  read USER_GUESS
done

# Masukkan hasil permainan ke database setelah menang
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)")

# Cetak pesan sukses kemenangan
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
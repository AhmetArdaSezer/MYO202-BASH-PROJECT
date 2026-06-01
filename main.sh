#!/bin/bash
# İsim SOYİSİM: Ahmet Arda Sezer
# Öğrenci Numarası: 2420191025
# Sertifika Bağlantıları: 
# 1. Docker: https://drive.google.com/file/d/1wgMW-bHv9dvwoFTA5lk7riesY1-uOaLn/view?usp=drive_link
# 2. Linux: https://drive.google.com/file/d/14FvEB0Y0TdUchwrUwp1q30SN6HOC1A_X/view?usp=drive_link
# 3. Bash Script:https://credsverse.com/credentials/3e26ce31-a90e-4dc0-a8ed-32ca36ef823f 

echo "Başlangıç Zamanı: $(date -Iseconds)" > report.log
echo -e "\n--- DONANIM BİLGİLERİ ---" >> report.log

# Windows donanım komutları
echo "İşletim Sistemi: Windows" >> report.log
echo -e "\n[İşlemci]" >> report.log
wmic cpu get name >> report.log 2>/dev/null
echo -e "\n[RAM]" >> report.log
wmic memorychip get capacity >> report.log 2>/dev/null
echo -e "\n[Anakart]" >> report.log
wmic baseboard get product,Manufacturer >> report.log 2>/dev/null
echo -e "\n[UUID]" >> report.log
wmic csproduct get uuid >> report.log 2>/dev/null
echo -e "\n[MAC Adresi]" >> report.log
getmac >> report.log 2>/dev/null

read -p "Lütfen şifreleme için parolayı giriniz: " PAROLA

echo "Rapor dosyası şifreleniyor..."
gpg --batch --yes --passphrase "$PAROLA" --symmetric --cipher-algo AES256 -o report.log.gpg report.log

if [ -f "report.log.gpg" ]; then
    rm report.log
    echo "İşlem başarılı. report.log.gpg oluşturuldu."
else
    echo "Hata oluştu!"
fi


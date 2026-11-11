วิธีแก้ Build Failure
1. โหลดไฟล์ fix นี้ แตกออก
2. ใน GitHub Repo Money-Voice กด Add file > Upload files
3. ลากไฟล์ในโฟลเดอร์ fix นี้ทั้งหมดขึ้นไปทับไฟล์เดิม
   - android/settings.gradle
   - android/build.gradle
   - android/app/build.gradle
   - android/gradle.properties
   - android/gradle/wrapper/gradle-wrapper.properties
   - android/app/src/main/kotlin/com/moneyvoice/app/MainActivity.kt
   - .github/workflows/build-apk.yml (ทับของเก่า)
4. ลบไฟล์ซ้ำ: pubspec_1.yaml, README_1.md (กดเข้าไปในไฟล์ > จุด 3 จุด > Delete file)
5. ไปที่แท็บ Actions > Run workflow อีกครั้ง
6. ถ้ายังพัง ให้กดเข้าไปใน Job build > ดูบรรทัดสีแดง 10 บรรทัดสุดท้าย แล้วแคปส่งมาให้ดู
สาเหตุที่พังรอบแรก: โฟลเดอร์ android/ ยังไม่มีไฟล์ build.gradle, settings.gradle, MainActivity.kt เลยทำให้ flutter build หาโปรเจกต์ Android ไม่เจอ

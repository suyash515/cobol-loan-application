       IDENTIFICATION DIVISION.
       PROGRAM-ID. BACKUP-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BACKUP-FILE ASSIGN TO 'BACKUP.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  BACKUP-FILE.
       01  BACKUP-REC.
           05  BACKUP-ID           PIC 9(5).
           05  FILE-NAME           PIC A(30).
           05  BACKUP-DATE         PIC 9(8).
           05  BACKUP-DATA         PIC A(100).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  WS-BACKUP-ID           PIC 9(5).
       01  WS-FILE-NAME           PIC A(30).
       01  WS-BACKUP-DATE         PIC 9(8).
       01  WS-BACKUP-DATA         PIC A(100).

       PROCEDURE DIVISION.

       OPEN INPUT BACKUP-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file BACKUP-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Backup ID: '
       ACCEPT WS-BACKUP-ID
       DISPLAY 'Enter File Name: '
       ACCEPT WS-FILE-NAME
       DISPLAY 'Enter Backup Date (YYYYMMDD): '
       ACCEPT WS-BACKUP-DATE
       DISPLAY 'Enter Backup Data: '
       ACCEPT WS-BACKUP-DATA

       MOVE WS-BACKUP-ID TO BACKUP-ID IN BACKUP-REC
       MOVE WS-FILE-NAME TO FILE-NAME IN BACKUP-REC
       MOVE WS-BACKUP-DATE TO BACKUP-DATE IN BACKUP-REC
       MOVE WS-BACKUP-DATA TO BACKUP-DATA IN BACKUP-REC

       WRITE BACKUP-REC

       CLOSE BACKUP-FILE
       DISPLAY 'Backup Record Added Successfully.'
       STOP RUN.

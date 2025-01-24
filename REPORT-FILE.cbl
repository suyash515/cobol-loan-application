       IDENTIFICATION DIVISION.
       PROGRAM-ID. REPORT-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT REPORT-FILE ASSIGN TO 'REPORT.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  REPORT-FILE.
       01  REPORT-REC.
           05  REPORT-ID           PIC 9(5).
           05  REPORT-TYPE         PIC A(30).
           05  GENERATED-DATE      PIC 9(8).
           05  REPORT-DATA         PIC A(100).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  REPORT-ID              PIC 9(5).
       01  REPORT-TYPE            PIC A(30).
       01  GENERATED-DATE         PIC 9(8).
       01  REPORT-DATA            PIC A(100).

       PROCEDURE DIVISION.

       OPEN INPUT REPORT-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file REPORT-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Report ID: '
       ACCEPT REPORT-ID
       DISPLAY 'Enter Report Type: '
       ACCEPT REPORT-TYPE
       DISPLAY 'Enter Generated Date (YYYYMMDD): '
       ACCEPT GENERATED-DATE
       DISPLAY 'Enter Report Data: '
       ACCEPT REPORT-DATA

       WRITE REPORT-REC

       CLOSE REPORT-FILE
       DISPLAY 'Report Record Added Successfully.'
       STOP RUN.


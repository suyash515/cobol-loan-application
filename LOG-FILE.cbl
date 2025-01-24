       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOG-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LOG-FILE ASSIGN TO 'LOG.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  LOG-FILE.
       01  LOG-REC.
           05  ACTION-TYPE         PIC A(20).
           05  TIMESTAMP           PIC 9(8).
           05  USER-ID             PIC A(10).
           05  ACTION-DESCRIPTION  PIC A(50).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  ACTION-TYPE            PIC A(20).
       01  TIMESTAMP              PIC 9(8).
       01  USER-ID                PIC A(10).
       01  ACTION-DESCRIPTION     PIC A(50).

       PROCEDURE DIVISION.

       OPEN INPUT LOG-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file LOG-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Action Type: '
       ACCEPT ACTION-TYPE
       DISPLAY 'Enter Timestamp (YYYYMMDD): '
       ACCEPT TIMESTAMP
       DISPLAY 'Enter User ID: '
       ACCEPT USER-ID
       DISPLAY 'Enter Action Description: '
       ACCEPT ACTION-DESCRIPTION

       WRITE LOG-REC

       CLOSE LOG-FILE
       DISPLAY 'Log Record Added Successfully.'
       STOP RUN.


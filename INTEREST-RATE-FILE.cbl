       IDENTIFICATION DIVISION.
       PROGRAM-ID. INTEREST-RATE-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INTEREST-RATE-FILE ASSIGN TO 'INTEREST_RATE.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  INTEREST-RATE-FILE.
       01  INTEREST-RATE-REC.
           05  LOAN-TYPE           PIC A(20).
           05  INTEREST-RATE       PIC 9(3)V99.
           05  EFFECTIVE-DATE      PIC 9(8).

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  LOAN-TYPE              PIC A(20).
       01  INTEREST-RATE          PIC 9(3)V99.
       01  EFFECTIVE-DATE         PIC 9(8).

       PROCEDURE DIVISION.

       OPEN INPUT INTEREST-RATE-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file INTEREST-RATE-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Loan Type: '
       ACCEPT LOAN-TYPE
       DISPLAY 'Enter Interest Rate (e.g., 5.75): '
       ACCEPT INTEREST-RATE
       DISPLAY 'Enter Effective Date (YYYYMMDD): '
       ACCEPT EFFECTIVE-DATE

       WRITE INTEREST-RATE-REC

       CLOSE INTEREST-RATE-FILE
       DISPLAY 'Interest Rate Record Added Successfully.'
       STOP RUN.


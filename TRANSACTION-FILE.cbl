       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRANSACTION-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSACTION-FILE ASSIGN TO 'TRANSACTION.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  TRANSACTION-FILE.
       01  TRANSACTION-REC.
           05  TRANSACTION-ID      PIC 9(5).
           05  LOAN-ID              PIC 9(5).
           05  PAYMENT-DATE         PIC 9(8).
           05  PAYMENT-AMOUNT       PIC 9(7)V99.
           05  REMAINING-BALANCE    PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  TRANSACTION-ID         PIC 9(5).
       01  LOAN-ID                PIC 9(5).
       01  PAYMENT-DATE           PIC 9(8).
       01  PAYMENT-AMOUNT         PIC 9(7)V99.
       01  REMAINING-BALANCE      PIC 9(7)V99.

       PROCEDURE DIVISION.

       OPEN INPUT TRANSACTION-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file TRANSACTION-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Transaction ID: '
       ACCEPT TRANSACTION-ID
       DISPLAY 'Enter Loan ID: '
       ACCEPT LOAN-ID
       DISPLAY 'Enter Payment Date (YYYYMMDD): '
       ACCEPT PAYMENT-DATE
       DISPLAY 'Enter Payment Amount: '
       ACCEPT PAYMENT-AMOUNT
       DISPLAY 'Enter Remaining Balance: '
       ACCEPT REMAINING-BALANCE

       WRITE TRANSACTION-REC

       CLOSE TRANSACTION-FILE
       DISPLAY 'Transaction Record Added Successfully.'
       STOP RUN.


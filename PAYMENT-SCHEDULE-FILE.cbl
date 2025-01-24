       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYMENT-SCHEDULE-FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PAYMENT-SCHEDULE-FILE ASSIGN TO 'PAYMENT_SCHEDULE.DAT'
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  PAYMENT-SCHEDULE-FILE.
       01  PAYMENT-SCHEDULE-REC.
           05  LOAN-ID            PIC 9(5).
           05  PAYMENT-DUE-DATE   PIC 9(8).
           05  PAYMENT-AMOUNT     PIC 9(7)V99.
           05  INTEREST-AMOUNT    PIC 9(7)V99.
           05  PRINCIPAL-AMOUNT   PIC 9(7)V99.

       WORKING-STORAGE SECTION.
       01  FILE-STATUS            PIC XX.
           88  FILE-OK             VALUE '00'.
           88  FILE-ERROR          VALUE '10'.
       01  LOAN-ID                PIC 9(5).
       01  PAYMENT-DUE-DATE       PIC 9(8).
       01  PAYMENT-AMOUNT         PIC 9(7)V99.
       01  INTEREST-AMOUNT        PIC 9(7)V99.
       01  PRINCIPAL-AMOUNT       PIC 9(7)V99.

       PROCEDURE DIVISION.

       OPEN INPUT PAYMENT-SCHEDULE-FILE
           IF FILE-ERROR
               DISPLAY 'Error opening file PAYMENT-SCHEDULE-FILE.'
               STOP RUN
           END-IF

       DISPLAY 'Enter Loan ID: '
       ACCEPT LOAN-ID
       DISPLAY 'Enter Payment Due Date (YYYYMMDD): '
       ACCEPT PAYMENT-DUE-DATE
       DISPLAY 'Enter Payment Amount: '
       ACCEPT PAYMENT-AMOUNT
       DISPLAY 'Enter Interest Amount: '
       ACCEPT INTEREST-AMOUNT
       DISPLAY 'Enter Principal Amount: '
       ACCEPT PRINCIPAL-AMOUNT

       WRITE PAYMENT-SCHEDULE-REC

       CLOSE PAYMENT-SCHEDULE-FILE
       DISPLAY 'Payment Schedule Record Added Successfully.'
       STOP RUN.


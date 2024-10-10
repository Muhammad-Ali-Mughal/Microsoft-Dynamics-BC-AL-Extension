report 50105 "Cust. Ledger Entries Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './layouts/Cust. Ledger Entries Report.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.";
            // Company Info
            column(companyName; companyInfo.Name) { }
            // Customer Info
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Opening_Balance; "Balance") { }
            column(Date_From; Date_From) { }
            column(Date_To; Date_To) { }

            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = sorting("Posting Date");

                // Table Fields
                column(Posting_Date; "Posting Date") { }
                column(Document_No_; "Document No.") { }
                column(Amount; Amount) { }
                column(Invoice_Amount; "Debit Amount") { }
                column(Payment; "Credit Amount") { }
                column(Balance; Balance) { }
                column(Cash; Cash) { }
                column(Credit; Credit) { }
                trigger OnAfterGetRecord()
                begin
                    // Calculating Balance
                    Balance := Balance + "Debit Amount" - "Credit Amount";

                    // Calculating Cash
                    if (Amount > 0) and (Balance <= 0) then begin
                        Cash := "Debit Amount";
                        Credit := 0;
                    end;
                    if (Amount > 0) and (Balance > 0) then begin
                        Cash := "Debit Amount" - Balance;
                    end;
                    // Cash := "Debit Amount" - Balance;
                    if Amount < 0 then Cash := 0;
                    Credit := Balance;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Posting Date", Date_From, Date_To);
                    Customer.CalcFields(Balance);
                    Balance := Customer.Balance;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                // Customer.CalcFields(Balance);
                // Balance := Customer.Balance;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(Date_From; Date_From)
                    {
                        ApplicationArea = All;
                        Caption = 'From Date';
                    }
                    field(Date_To; Date_To)
                    {
                        ApplicationArea = All;
                        Caption = 'To Date';
                    }
                }
            }
        }

        actions
        {
            area(processing) { }
        }
    }
    trigger OnInitReport()
    begin
        companyInfo.Get();
    end;

    var
        companyInfo: Record "Company Information";
        Balance: Decimal;
        Cash: Decimal;
        Credit: Decimal;
        Customer_No: Code[20];
        Date_From: Date;
        Date_To: Date;
}

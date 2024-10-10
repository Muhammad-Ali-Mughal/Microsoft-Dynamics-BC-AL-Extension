report 50106 "Open Cust. Ledger Entries"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './layouts/Open Cust Ledger Entries Report.rdl';

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
            column(Date_To; Date_To) { }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                DataItemTableView = where(Open = const(true));

                // Table Fields
                column(Posting_Date; "Posting Date") { }
                column(Document_No_; "Document No.") { }
                column(Document_Type; "Document Type") { }
                column(Description; Description) { }
                column(Open; Open) { }
                column(Amount; Amount) { }
                trigger OnPreDataItem()
                begin
                    SetRange("Posting Date", 0D, Date_To);
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    // field(Customer_No; Customer_No)
                    // {
                    //     Caption = 'Customer';
                    //     ApplicationArea = All;
                    //     TableRelation = Customer;
                    // }
                    field(Date_To; Date_To)
                    {
                        Caption = 'Due Date';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    trigger OnInitReport()
    begin
        companyInfo.Get();
    end;

    var
        companyInfo: Record "Company Information";
        Customer_No: Code[20];
        Date_To: Date;
}
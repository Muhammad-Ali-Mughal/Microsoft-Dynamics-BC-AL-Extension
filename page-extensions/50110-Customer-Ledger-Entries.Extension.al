pageextension 50110 "Cust. Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout { }

    actions
    {
        addafter("&Navigate")
        {
            action("Print Cust. Ledger Entries")
            {
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                var
                begin
                    // CurrPage.SetSelectionFilter(Rec);
                    Report.Run(50105, true, false, Rec);
                end;
            }
        }
    }

    var
}
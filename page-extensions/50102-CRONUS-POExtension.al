pageextension 50102 "Print PO Action" extends "Purchase Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(navigation)
        {
            action("Print PO")
            {
                ApplicationArea = All;
                Caption = 'Print PO';
                Image = Report;
                // RunObject = report "Purchase Order Report";
                trigger OnAction()
                var
                    PurchaseHeader: Record "Purchase Header";
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(50102, true, false, Rec);
                end;
            }
        }
    }

    var
}
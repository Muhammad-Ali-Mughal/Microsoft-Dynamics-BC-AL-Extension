pageextension 50103 "Cronus Sale Invoice Extension" extends "Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Invoice")
        {
            action("Print Invoice Action")
            {
                ApplicationArea = All;
                Caption = 'Print Sales Invoice';
                Image = Report;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(50103, true, false, Rec);
                end;
            }
        }
    }

    var
}
pageextension 50104 "Posted PO Page Extension" extends "Posted Purchase Invoice"
{
    layout { }

    actions
    {
        addlast(navigation)
        {
            action("Print Posted PO")
            {
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(50104, true, false, Rec);
                end;
            }
        }
    }

    var
}
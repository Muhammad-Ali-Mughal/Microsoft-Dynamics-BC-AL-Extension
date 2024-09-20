pageextension 50105 "Purch Invoice Subform Ext" extends "Purch. Invoice Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field(Dispute; Rec.Dispute)
            {
                ApplicationArea = All;
                Visible = Visibility;
            }
            field("Dispute No."; Rec."Dispute No.")
            {
                ApplicationArea = All;
                Visible = Visibility;
            }
            field("Dispute Line No."; Rec."Dispute Line No.")
            {
                ApplicationArea = All;
                Visible = Visibility;
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    var
    begin
        CheckVisibility();
    end;

    local procedure CheckVisibility()
    var
    begin
        // "Setup Dispute".Get();
        if "Setup Dispute".FindSet() then Visibility := "Setup Dispute"."Enable Vendor Disputes";
    end;

    var
        "Setup Dispute": Record "Setup Dispute";
        Visibility: Boolean;
}
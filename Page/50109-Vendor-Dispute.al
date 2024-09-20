page 50109 "Vendor Dispute"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Dispute Header";

    layout
    {
        area(Content)
        {
            group("Vendor Details")
            {
                field("Dispute No."; Rec."Dispute No.")
                {
                    ApplicationArea = all;
                    // Editable = false;
                }
                field("Dispute Status"; Rec."Dispute Status") { ApplicationArea = All; }
                field("Vendor No"; Rec."Vendor No") { ApplicationArea = All; }
                field("Country Code"; Rec."Country Code") { ApplicationArea = All; }
                field(City; Rec.City) { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
                field("Reference Document No"; Rec."Reference Document No") { ApplicationArea = All; }
                field("Return Location Code"; Rec."Return Location Code") { ApplicationArea = All; }
            }
            group("Dispute Lines")
            {
                part("Vendor Dispute Listpart"; "Vendor Dispute Listpart")
                {
                    ApplicationArea = All;
                    SubPageLink = "Dispute No." = field("Dispute No.");
                    UpdatePropagation = Both;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }


}
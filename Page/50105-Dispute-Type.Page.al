page 50105 "Dispute Type"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Dispute Type";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Provenance Disputed"; Rec."Provenance Disputed") { ApplicationArea = All; }
                field("Dispute Type Code"; Rec."Dispute Type Code") { ApplicationArea = All; }
                field("Discription Type Dispute"; Rec."Discription Type Dispute") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print/Send")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}
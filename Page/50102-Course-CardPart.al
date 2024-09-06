page 50102 "Cronus Course CardPart"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CRONUS Course";
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'CardPart';
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;

                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;

                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;

                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;

                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;

                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;

                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;

                }
            }

        }
    }


}
table 50107 "Dispute Reason"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Dispute Reason";
    LookupPageId = "Dispute Reason";

    fields
    {
        field(10; "Provenance Disputed"; Enum "Provenance Disputed")
        {
            DataClassification = ToBeClassified;

        }
        field(20; "Casual Complaint"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";

        }
        field(30; "Item Charge"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(40; "Returned Order Reason"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";

        }
        field(50; "Reason for Purchase Order"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";

        }
        field(60; "Casual Generic Dispute"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";

        }
        field(70; "Return Reason"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";

        }
        field(80; "Return Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

        }
        field(90; "Note for Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location;

        }
        field(100; "Dispute Description"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(110; "Document to be Generated"; Enum "Dispute Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Return Required"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(130; "Dispute Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dispute Type";
        }
        field(140; "Line Type"; Enum "Purchase Line Type")
        {
            DataClassification = ToBeClassified;
        }
        field(150; "Decimal Threshold"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(160; Visible; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Casual Complaint")
        {
            Clustered = true;
        }
    }
}
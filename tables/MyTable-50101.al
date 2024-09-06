table 50101 "MyTable"
{
    DataClassification = ToBeClassified;
    Caption = 'My Table';
    // DrillDownPageId = "My Page";
    // LookupPageId = "My Page";

    fields
    {
        field(1; "Doc No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Doc No.';
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
        }

        field(3; Quantity; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Quatity';
        }

        field(4; "Unit Price"; Integer)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }

        field(5; "Line Amount"; Integer)
        {
            Caption = 'Line Amount';
            DataClassification = CustomerContent;
        }
        field(6; Dispute; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Doc No.")
        {
            Clustered = true;
        }
    }
}
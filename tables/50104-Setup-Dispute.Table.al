table 50104 "Setup Dispute"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Enable Vendor Disputes"; Boolean)
        {
            DataClassification = CustomerContent;

        }
        field(20; "Enable Write Cont. Vendors"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(30; "Dispute Series No."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;

        }
        field(40; "Type of Operation Returned Ord"; Code[20])
        {
            Caption = 'Type of Operation Returned Order';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

        }
        field(50; "Type of Operation Credit Notes"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";

        }
        field(60; "Minimum Amount Threshold"; Decimal)
        {
            DataClassification = CustomerContent;

        }
        field(70; "E-Mail Text"; Text[50])
        {
            DataClassification = CustomerContent;

        }
        field(80; "G/L Account Vendor Disputes"; Code[20])
        {
            Caption = 'G/L Account for Vendor Disputes';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";

        }
        field(90; "Vendor Batch"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch";

        }
        field(100; "Vendor Template Name"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";

        }
    }

    keys
    {
        key(PK; "Dispute Series No.")
        {
            Clustered = true;
        }
    }
}
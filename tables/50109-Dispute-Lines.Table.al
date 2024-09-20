table 50109 "Dispute Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Provenance Disputed"; Enum "Provenance Disputed") { DataClassification = CustomerContent; }
        field(20; "Dispute No."; Code[20]) { DataClassification = CustomerContent; }
        field(30; "Document Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Invoice","Credit Notes";
        }
        field(40; "Dispute Line No."; Integer) { DataClassification = CustomerContent; }
        field(50; "Item No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(60; "Line Description"; Text[100]) { DataClassification = CustomerContent; }
        field(70; "Base Unit of Measure"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(80; "Basic Quantity"; Decimal) { DataClassification = CustomerContent; }
        field(90; "Unit of Measure"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(100; "Quantity Per Unit of Measure"; Decimal) { DataClassification = CustomerContent; }
        field(110; "Unit Price"; Decimal) { DataClassification = CustomerContent; }
        field(120; "Modified UserId"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = User;
        }
        field(130; "DateTime Moified"; DateTime) { DataClassification = CustomerContent; }
        field(140; "Dispute Reason"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dispute Reason";
        }
        field(150; "Dispute Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dispute Type";
        }
        field(160; "Dispute Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(170; "Dispute Measure Unit"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(180; "Dispute Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(190; "Dispute Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(200; "Dispute Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(210; "Dispute Location"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(220; "Dispute Return Quantity"; Decimal) { DataClassification = CustomerContent; }
        field(230; "Dispute Description"; Text[100]) { DataClassification = CustomerContent; }
        field(240; "Document to be Created"; Enum "Dispute Document Type") { DataClassification = CustomerContent; }
        field(250; "Line Type"; Enum "Purchase Line Type") { DataClassification = CustomerContent; }
        field(260; "Returned Order Reason"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
        }
        field(270; "Reason for Credit Note"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Reason Code";
        }
        field(280; "Returned Order Location"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(290; "Location for Credit Note"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(300; "Dispute Item Description"; Text[100]) { DataClassification = CustomerContent; }
        field(310; "Vendor No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(320; "Job Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job;
        }
        field(330; "Task Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Job Task";
        }
        field(340; "Reference Document No."; Code[20]) { DataClassification = ToBeClassified; }
        field(350; "Reference Document Line"; Integer) { DataClassification = CustomerContent; }
        field(360; "Document No. Created"; Code[20]) { DataClassification = CustomerContent; }
        field(370; "Document Line No. Created"; Integer) { DataClassification = CustomerContent; }
        field(380; "Dispute Status"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dispute Status";
        }
        field(390; "No. Movement"; Integer) { DataClassification = CustomerContent; }
    }

    keys
    {
        key(PK; "Dispute Line No.")
        {
            Clustered = true;
        }
    }
}
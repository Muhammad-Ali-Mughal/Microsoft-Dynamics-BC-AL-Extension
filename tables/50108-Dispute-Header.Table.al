table 50108 "Dispute Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Provenance Dispute"; Enum "Provenance Disputed") { DataClassification = CustomerContent; }
        field(20; "Dispute No."; Code[20])
        { DataClassification = CustomerContent; }
        field(30; "Document Type"; Enum "Document Type") { DataClassification = CustomerContent; }
        field(40; "City"; Text[100]) { DataClassification = CustomerContent; }
        field(50; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
            DataClassification = CustomerContent;
        }
        field(60; "Return Location Code"; Code[10])
        {
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
        field(70; "Created By"; Code[50])
        {
            TableRelation = User;
            DataClassification = CustomerContent;
        }
        field(80; "Created Date"; DateTime) { DataClassification = CustomerContent; }
        field(90; "Modified by UserId"; Code[50])
        {
            TableRelation = User;
            DataClassification = CustomerContent;
        }
        field(100; "Date Modified"; DateTime) { DataClassification = CustomerContent; }
        field(110; "Vendor No"; Code[20])
        {
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(120; "Company Name"; Text[100]) { DataClassification = CustomerContent; }
        field(130; "Reference Document No"; Code[20]) { DataClassification = CustomerContent; }
        field(140; "Dispute Description"; Text[100]) { DataClassification = CustomerContent; }
        field(150; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Dispute Lines"."Dispute Amount");
        }
        field(160; "Dispute Status"; Code[20])
        {
            TableRelation = "Dispute Status";
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Dispute No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NoSeries: Codeunit "NoSeriesManagement";
        Disputesetup: Record "Setup Dispute";
    begin
        if Disputesetup.Get() then
            Disputesetup.TestField("Dispute Series No.");
        if rec."Dispute No." = '' then
            rec."Dispute No." := NoSeries.GetNextNo(Disputesetup."Dispute Series No.", Today, true);
    end;
}
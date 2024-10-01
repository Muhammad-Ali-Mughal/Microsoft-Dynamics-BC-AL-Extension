pageextension 50108 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
{
    layout { }

    actions
    {
        addafter("Actions")
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
            action("Create Dispute")
            {
                ApplicationArea = All;
                Caption = 'Create Dispute';
                Image = Create;
                Promoted = true;
                PromotedCategory = New;
                Visible = Visibility;

                trigger OnAction()
                var
                    Item: Record Item;
                    "Purch. Inv. Header": Record "Purch. Inv. Header";
                    "Dispute Header": Record "Dispute Header";
                    "Setup Dispute": Record "Setup Dispute";
                    "Purch. Inv. Line": Record "Purch. Inv. Line";
                    "Dispute Line": Record "Dispute Lines";
                    NoSeries: Codeunit NoSeriesManagement;
                begin
                    "Purch. Inv. Header".SetRange("No.", Rec."No.");
                    if "Purch. Inv. Header".FindFirst() then begin
                        "Dispute Header".SetRange("Reference Document No", "Purch. Inv. Header"."No.");
                        if "Dispute Header".FindFirst() then begin
                            "Purch. Inv. Line".SetRange("Document No.", Rec."No.");
                            if "Purch. Inv. Line".FindSet() then begin
                                "Purch. Inv. Line".SetRange("Dispute Line No.", 0);
                                if "Purch. Inv. Line".FindSet() then begin
                                    repeat
                                        "Dispute Line".Init();
                                        "Dispute Line".Validate("Provenance Disputed", "Dispute Header"."Provenance Dispute");
                                        "Dispute Line".Validate("Dispute No.", "Dispute Header"."Dispute No.");
                                        "Dispute Line".Validate("Document Type", "Dispute Header"."Document Type");

                                        "Dispute Line"."Item No" := "Purch. Inv. Line"."No.";
                                        "Dispute Line"."No. Movement" := "Purch. Inv. Line"."Line No.";
                                        "Dispute Line"."Line Description" := "Purch. Inv. Line".Description;
                                        Item.SetRange("No.", "Purch. Inv. Line"."No.");
                                        if Item.FindFirst() then begin
                                            "Dispute Line"."Base Unit of Measure" := Item."Base Unit of Measure";
                                            "Dispute Line"."Vendor No" := Item."Vendor Item No.";
                                        end;
                                        "Dispute Line"."Basic Quantity" := "Purch. Inv. Line".Quantity;
                                        "Dispute Line"."Unit of Measure" := "Purch. Inv. Line"."Unit of Measure";
                                        "Dispute Line"."Quantity Per Unit of Measure" := "Purch. Inv. Line"."Qty. per Unit of Measure";
                                        "Dispute Line"."Unit Price" := "Purch. Inv. Line"."Direct Unit Cost";
                                        "Dispute Line"."Modified UserId" := UserId;
                                        "Dispute Line"."DateTime Moified" := CurrentDateTime;
                                        // "Dispute Line"."Dispute Reason" := '-';
                                        "Dispute Line"."Reference Document No." := "Purch. Inv. Line"."Document No.";
                                        "Dispute Line"."Reference Document Line" := "Purch. Inv. Line"."Line No.";
                                        "Dispute Line"."Dispute Status" := "Dispute Header"."Dispute Status";
                                        // "Purch. Inv. Line".SetRange("Dispute No.", "Dispute Header"."Dispute No.");
                                        // if "Purch. Inv. Line".FindLast() then
                                        "Dispute Line"."Dispute Line No." := "Purch. Inv. Line"."Line No.";
                                        "Dispute Line".Insert();

                                    until "Purch. Inv. Line".Next() = 0;
                                end;
                            end;
                        end
                        else begin
                            "Dispute Header".Init();
                            "Dispute Header"."Provenance Dispute" := Enum::"Provenance Disputed"::Vendor;
                            // "Dispute Header"."Dispute No." := NoSeries.GetNextNo("Setup Dispute"."Dispute Series No.", Today, true);
                            "Dispute Header"."Document Type" := Enum::"Document Type"::Invoice;
                            "Dispute Header".City := "Purch. Inv. Header"."Buy-from City";
                            "Dispute Header".Validate("Country Code", "Purch. Inv. Header"."Buy-from Country/Region Code");
                            "Dispute Header"."Return Location Code" := '';
                            "Dispute Header"."Created By" := UserId;
                            "Dispute Header"."Created Date" := CurrentDateTime;
                            "Dispute Header"."Modified by UserId" := UserId;
                            "Dispute Header"."Date Modified" := CurrentDateTime;
                            "Dispute Header"."Vendor No" := "Purch. Inv. Header"."Buy-from Vendor No.";
                            "Dispute Header"."Company Name" := "Purch. Inv. Header"."Buy-from Vendor Name";
                            "Dispute Header"."Reference Document No" := "Purch. Inv. Header"."No.";
                            "Dispute Header"."Dispute Description" := '';
                            "Dispute Header".Insert(true);

                            "Purch. Inv. Line".SetRange("Document No.", Rec."No.");
                            if "Purch. Inv. Line".FindSet() then begin
                                repeat
                                    "Dispute Line".Init();
                                    "Dispute Line".Validate("Provenance Disputed", "Dispute Header"."Provenance Dispute");
                                    "Dispute Line".Validate("Dispute No.", "Dispute Header"."Dispute No.");
                                    "Dispute Line".Validate("Document Type", "Dispute Header"."Document Type");
                                    "Dispute Line"."Dispute Line No." := "Purch. Inv. Line"."Line No.";
                                    "Dispute Line"."Item No" := "Purch. Inv. Line"."No.";
                                    "Dispute Line"."No. Movement" := "Purch. Inv. Line"."Line No.";
                                    "Dispute Line"."Line Description" := "Purch. Inv. Line".Description;
                                    Item.SetRange("No.", "Purch. Inv. Line"."No.");
                                    if Item.FindFirst() then begin
                                        "Dispute Line"."Base Unit of Measure" := Item."Base Unit of Measure";
                                        "Dispute Line"."Vendor No" := Item."Vendor Item No.";
                                    end;
                                    "Dispute Line"."Basic Quantity" := "Purch. Inv. Line".Quantity;
                                    "Dispute Line"."Unit of Measure" := "Purch. Inv. Line"."Unit of Measure";
                                    "Dispute Line"."Quantity Per Unit of Measure" := "Purch. Inv. Line"."Qty. per Unit of Measure";
                                    "Dispute Line"."Unit Price" := "Purch. Inv. Line"."Direct Unit Cost";
                                    "Dispute Line"."Modified UserId" := UserId;
                                    "Dispute Line"."DateTime Moified" := CurrentDateTime;
                                    // "Dispute Line"."Dispute Reason" := '-';
                                    "Dispute Line"."Reference Document No." := "Purch. Inv. Line"."Document No.";
                                    "Dispute Line"."Reference Document Line" := "Purch. Inv. Line"."Line No.";
                                    "Dispute Line"."Dispute Status" := "Dispute Header"."Dispute Status";
                                    "Dispute Line".Insert();

                                until "Purch. Inv. Line".Next() = 0;
                            end;
                        end;

                    end;

                end;
            }

            // action("Go to Dispute")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Go to Dispute';
            //     Image = Navigate;
            //     Promoted = true;
            //     PromotedCategory = New;
            //     Visible = Visibility;
            //     RunObject = page "Vendor Dispute Lits";
            //     RunPageLink = "Reference Document No" = field("No.");
            // }
        }
    }

    trigger OnOpenPage()
    var
    begin
        if "Setup Dispute".FindSet() then
            Visibility := "Setup Dispute"."Enable Vendor Disputes";
    end;

    var
        "Setup Dispute": Record "Setup Dispute";
        Visibility: Boolean;
}
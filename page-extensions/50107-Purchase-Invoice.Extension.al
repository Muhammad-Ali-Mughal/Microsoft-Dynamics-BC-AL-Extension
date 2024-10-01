pageextension 50107 "Purchase Invoice Ext" extends "Purchase Invoice"
{
    layout { }

    actions
    {
        addafter("P&osting")
        {
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
                    "Purchase Header": Record "Purchase Header";
                    "Dispute Header": Record "Dispute Header";
                    "Setup Dispute": Record "Setup Dispute";
                    "Purchase Line": Record "Purchase Line";
                    "Dispute Line": Record "Dispute Lines";
                    NoSeries: Codeunit NoSeriesManagement;
                begin
                    "Purchase Header".SetRange("No.", Rec."No.");
                    if "Purchase Header".FindFirst() then begin
                        "Dispute Header".SetRange("Reference Document No", "Purchase Header"."No.");
                        if "Dispute Header".FindFirst() then begin
                            "Purchase Line".SetRange("Document No.", Rec."No.");
                            if "Purchase Line".FindSet() then begin
                                "Purchase Line".SetRange("Dispute Line No.", 0);
                                if "Purchase Line".FindSet() then begin
                                    repeat
                                        "Dispute Line".Init();
                                        "Dispute Line".Validate("Provenance Disputed", "Dispute Header"."Provenance Dispute");
                                        "Dispute Line".Validate("Dispute No.", "Dispute Header"."Dispute No.");
                                        "Dispute Line".Validate("Document Type", "Dispute Header"."Document Type");

                                        "Dispute Line"."Item No" := "Purchase Line"."No.";
                                        "Dispute Line"."No. Movement" := "Purchase Line"."Line No.";
                                        "Dispute Line"."Line Description" := "Purchase Line".Description;
                                        Item.SetRange("No.", "Purchase Line"."No.");
                                        if Item.FindFirst() then begin
                                            "Dispute Line"."Base Unit of Measure" := Item."Base Unit of Measure";
                                            "Dispute Line"."Vendor No" := Item."Vendor Item No.";
                                        end;
                                        "Dispute Line"."Basic Quantity" := "Purchase Line".Quantity;
                                        "Dispute Line"."Unit of Measure" := "Purchase Line"."Unit of Measure";
                                        "Dispute Line"."Quantity Per Unit of Measure" := "Purchase Line"."Qty. per Unit of Measure";
                                        "Dispute Line"."Unit Price" := "Purchase Line"."Direct Unit Cost";
                                        "Dispute Line"."Modified UserId" := UserId;
                                        "Dispute Line"."DateTime Moified" := CurrentDateTime;
                                        // "Dispute Line"."Dispute Reason" := '-';
                                        "Dispute Line"."Reference Document No." := "Purchase Line"."Document No.";
                                        "Dispute Line"."Reference Document Line" := "Purchase Line"."Line No.";
                                        "Dispute Line"."Dispute Status" := "Dispute Header"."Dispute Status";
                                        // "Purchase Line".SetRange("Dispute No.", "Dispute Header"."Dispute No.");
                                        // if "Purchase Line".FindLast() then
                                        "Dispute Line"."Dispute Line No." := "Purchase Line"."Line No.";
                                        "Dispute Line".Insert();

                                    until "Purchase Line".Next() = 0;
                                end;
                            end;
                        end
                        else begin
                            "Dispute Header".Init();
                            "Dispute Header"."Provenance Dispute" := Enum::"Provenance Disputed"::Vendor;
                            // "Dispute Header"."Dispute No." := NoSeries.GetNextNo("Setup Dispute"."Dispute Series No.", Today, true);
                            "Dispute Header"."Document Type" := Enum::"Document Type"::Invoice;
                            "Dispute Header".City := "Purchase Header"."Buy-from City";
                            "Dispute Header".Validate("Country Code", "Purchase Header"."Buy-from Country/Region Code");
                            "Dispute Header"."Return Location Code" := '';
                            "Dispute Header"."Created By" := UserId;
                            "Dispute Header"."Created Date" := CurrentDateTime;
                            "Dispute Header"."Modified by UserId" := UserId;
                            "Dispute Header"."Date Modified" := CurrentDateTime;
                            "Dispute Header"."Vendor No" := "Purchase Header"."Buy-from Vendor No.";
                            "Dispute Header"."Company Name" := "Purchase Header"."Buy-from Vendor Name";
                            "Dispute Header"."Reference Document No" := "Purchase Header"."No.";
                            "Dispute Header"."Dispute Description" := '';
                            "Dispute Header".Insert(true);

                            "Purchase Line".SetRange("Document No.", Rec."No.");
                            if "Purchase Line".FindSet() then begin
                                repeat
                                    "Dispute Line".Init();
                                    "Dispute Line".Validate("Provenance Disputed", "Dispute Header"."Provenance Dispute");
                                    "Dispute Line".Validate("Dispute No.", "Dispute Header"."Dispute No.");
                                    "Dispute Line".Validate("Document Type", "Dispute Header"."Document Type");
                                    "Dispute Line"."Dispute Line No." := "Purchase Line"."Line No.";
                                    "Dispute Line"."Item No" := "Purchase Line"."No.";
                                    "Dispute Line"."No. Movement" := "Purchase Line"."Line No.";
                                    "Dispute Line"."Line Description" := "Purchase Line".Description;
                                    Item.SetRange("No.", "Purchase Line"."No.");
                                    if Item.FindFirst() then begin
                                        "Dispute Line"."Base Unit of Measure" := Item."Base Unit of Measure";
                                        "Dispute Line"."Vendor No" := Item."Vendor Item No.";
                                    end;
                                    "Dispute Line"."Basic Quantity" := "Purchase Line".Quantity;
                                    "Dispute Line"."Unit of Measure" := "Purchase Line"."Unit of Measure";
                                    "Dispute Line"."Quantity Per Unit of Measure" := "Purchase Line"."Qty. per Unit of Measure";
                                    "Dispute Line"."Unit Price" := "Purchase Line"."Direct Unit Cost";
                                    "Dispute Line"."Modified UserId" := UserId;
                                    "Dispute Line"."DateTime Moified" := CurrentDateTime;
                                    // "Dispute Line"."Dispute Reason" := '-';
                                    "Dispute Line"."Reference Document No." := "Purchase Line"."Document No.";
                                    "Dispute Line"."Reference Document Line" := "Purchase Line"."Line No.";
                                    "Dispute Line"."Dispute Status" := "Dispute Header"."Dispute Status";
                                    "Dispute Line".Insert();

                                until "Purchase Line".Next() = 0;
                            end;
                        end;

                    end;

                end;
            }

            action("Go to Dispute")
            {
                ApplicationArea = All;
                Caption = 'Go to Dispute';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = New;
                Visible = Visibility;
                RunObject = page "Vendor Dispute Lits";
                RunPageLink = "Reference Document No" = field("No.");
            }
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
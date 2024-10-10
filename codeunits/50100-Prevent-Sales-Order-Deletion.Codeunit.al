codeunit 50100 "Prevent Sales Order Deletion"
{
    [EventSubscriber(ObjectType::Codeunit, codeunit::"Sales-Post", 'OnBeforeDeleteAfterPosting', '', true, true)]
    procedure OnBeforeDeleteAfterPosting(var SkipDelete: Boolean; var SalesHeader: Record "Sales Header")
    begin
        // if SalesHeader.Status = SalesHeader.Status::Open then

        //     // UpdatedStatus := Enum::"Sales Document Status"::Closed;
        //     //     SalesHeader.SetStatus(UpdatedStatus);

        //     SalesHeader.Status := Enum::"Sales Document Status"::Closed;
        // SalesHeader.Modify();

        // Preventing deletion
        SkipDelete := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnReleaseSalesDocumentOnBeforeSetStatus', '', true, true)]
    procedure OnReleaseSalesDocumentOnBeforeSetStatus(var SalesHeader: Record "Sales Header"; SavedStatus: Enum "Sales Document Status"; var IsHandled: Boolean)
    begin
        SalesHeader.Status := Enum::"Sales Document Status"::Closed;

        SalesHeader.Modify();

        IsHandled := true;
    end;
}
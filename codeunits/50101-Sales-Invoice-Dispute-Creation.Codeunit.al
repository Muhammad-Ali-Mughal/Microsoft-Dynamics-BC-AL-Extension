codeunit 50101 "Sales Invoice Dispute Creation"
{
    // [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterFinalizePosting', '', true, true)]
    // local procedure IfUserChoosedNo(var SalesHeader: Record "Sales Header")
    // begin
    //     if not Confirm('Do you want to post this sales document?', true) then begin
    //         if Confirm('Do you want to create Dispute?', true) then
    //             Message('Dispute created for Sales Header %1', SalesHeader."No.");
    //     end;
    // end;
    // [EventSubscriber(ObjectType::Codeunit, 81, '', '', true, true)]

    // [EventSubscriber(ObjectType::Codeunit, 81, 'OnAfterConfirmPost', '', false, false)]
    // local procedure OnAfterConfirmPost(SalesHeader: Record "Sales Header")
    // begin
    //     if Confirm('The invoice is posted as number ' + SalesHeader."No." + ' and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', true) then
    //         Page.Run(Page::"Posted Sales Invoice")
    //     else
    //         if Confirm('Do you want to create Dispute?', true) then
    //             Message('Dispute created for Sales Header %1', SalesHeader."No.");
    // end;

}


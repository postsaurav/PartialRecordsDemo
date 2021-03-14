codeunit 50001 Table32Subscribers
{
    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure InsertItemLedger(RunTrigger: Boolean; var Rec: Record "Item Ledger Entry")
    var
        LibraryRandom: Codeunit "Library - Random";
    begin
        if not RunTrigger then
            exit;

        Rec.Ext1Int := LibraryRandom.RandIntInRange(1, 100);
        Rec.Ext2Int := LibraryRandom.RandIntInRange(2, 200);
        Rec.Ext3Int := LibraryRandom.RandIntInRange(3, 300);
        Rec.Modify();
    end;
}
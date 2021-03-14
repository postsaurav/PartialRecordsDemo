codeunit 50000 "Load Data Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        ItemJournalLine: Record "Item Journal Line";
        LibraryRandom: Codeunit "Library - Random";
        MaxRow: Integer;
        I: Integer;
    begin
        IF ItemJournalLine.FindSet() then
            ItemJournalLine.DeleteAll();

        MaxRow := 5;  //Increase this number to increase load in Docker Environment.
        for I := 1 to MaxRow do begin
            ItemJournalLine.Init();
            ItemJournalLine."Journal Template Name" := 'ITEM';
            ItemJournalLine."Journal Batch Name" := 'DEFAULT';
            ItemJournalLine."Line No." := I;
            ItemJournalLine."Posting Date" := Today();
            ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Positive Adjmt.";
            ItemJournalLine."Document No." := CopyStr(LibraryRandom.RandText(20), 1, MaxStrLen(ItemJournalLine."Document No."));
            ItemJournalLine.Validate("Item No.", GetItemNo());
            If ItemJournalLine."Item No." <> '' then begin
                ItemJournalLine.Validate(Quantity, LibraryRandom.RandIntInRange(1, 30));
                If ItemJournalLine."Unit Amount" = 0 then
                    ItemJournalLine.Validate("Unit Amount", LibraryRandom.RandIntInRange(12, 120));
                ItemJournalLine.Insert();
            end;
        end;
    end;

    local procedure GetItemNo(): Code[20]
    var
        Item: Record Item;
        LibraryRandom: Codeunit "Library - Random";
        cnt: Integer;
        RandomInt: Integer;
    begin
        RandomInt := LibraryRandom.RandIntInRange(1, 20);
        Item.Reset();
        IF Item.FindSet() then
            repeat
                cnt += 1;
                IF cnt = RandomInt then
                    exit(Item."No.");
            until (Item.Next() = 0);
    end;
}
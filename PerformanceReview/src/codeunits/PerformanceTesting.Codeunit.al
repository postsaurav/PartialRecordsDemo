codeunit 50002 PerformanceTesting
{
    trigger OnRun()
    var
        StartTime: Time;
        TotalAmt: Integer;
    begin
        StartTime := Time;
        TotalAmt := TotalExtIntFields();
        Message('Execution Time- %1 \ Total Value - %2', Time - StartTime, TotalAmt);
    end;

    local procedure TotalExtIntFields() TotalVal: Integer
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetLoadFields(Quantity);
        If ItemLedgerEntry.FindSet() then
            repeat
                TotalVal := TotalVal + ItemLedgerEntry.Ext1Int;
            until (ItemLedgerEntry.Next() = 0);
    end;
}
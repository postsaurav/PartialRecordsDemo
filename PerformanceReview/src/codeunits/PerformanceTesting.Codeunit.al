codeunit 50002 PerformanceTesting
{
    trigger OnRun()
    var
        StartTime: Time;
        TotalAmt: Decimal;
    begin
        StartTime := Time;
        TotalAmt := TotalExtIntFields();
        Message('Execution Time- %1 \ Total Value - %2', Time - StartTime, TotalAmt);
    end;

    local procedure TotalExtIntFields() TotalVal: Decimal
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetAutoCalcFields("Cost Amount (Actual)");
        ItemLedgerEntry.SetLoadFields("Cost Amount (Actual)");
        If ItemLedgerEntry.FindSet() then
            repeat
                TotalVal := TotalVal + ItemLedgerEntry."Cost Amount (Actual)";
            until (ItemLedgerEntry.Next() = 0);
    end;
}
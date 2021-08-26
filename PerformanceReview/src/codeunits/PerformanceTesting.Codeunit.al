codeunit 50002 PerformanceTesting
{

    var
        StartTime: Time;
        TotalAmt: Decimal;

    procedure LegacyCode()
    begin
        StartTime := Time;
        TotalAmt := LegacyCalculateAmount();
        Message('Execution Time- %1 \ Total Value - %2', Time - StartTime, TotalAmt);
    end;

    procedure LegacyCodewithAutoCalcFields()
    begin
        StartTime := Time;
        TotalAmt := LegacyWithAutoCalcFieldsCalculateAmount();
        Message('Execution Time- %1 \ Total Value - %2', Time - StartTime, TotalAmt);
    end;

    procedure LegacyCodewithPartialRecords()
    begin
        StartTime := Time;
        TotalAmt := LegacyWithPartialRecordsCalculateAmount();
        Message('Execution Time- %1 \ Total Value - %2', Time - StartTime, TotalAmt);
    end;

    local procedure LegacyCalculateAmount() TotalVal: Decimal
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        If ItemLedgerEntry.FindSet() then
            repeat
                ItemLedgerEntry.CalcFields("Cost Amount (Actual)");
                TotalVal := TotalVal + ItemLedgerEntry.Ext1Int + ItemLedgerEntry."Cost Amount (Actual)";
            until (ItemLedgerEntry.Next() = 0);
    end;

    local procedure LegacyWithAutoCalcFieldsCalculateAmount() TotalVal: Decimal
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetAutoCalcFields("Cost Amount (Actual)");
        If ItemLedgerEntry.FindSet() then
            repeat
                TotalVal := TotalVal + ItemLedgerEntry.Ext1Int + ItemLedgerEntry."Cost Amount (Actual)";
            until (ItemLedgerEntry.Next() = 0);
    end;

    local procedure LegacyWithPartialRecordsCalculateAmount() TotalVal: Decimal
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetAutoCalcFields("Cost Amount (Actual)");
        ItemLedgerEntry.SetLoadFields(Ext1Int, "Cost Amount (Actual)");
        If ItemLedgerEntry.FindSet() then
            repeat
                TotalVal := TotalVal + ItemLedgerEntry.Ext1Int + ItemLedgerEntry."Cost Amount (Actual)";
            until (ItemLedgerEntry.Next() = 0);
    end;
}
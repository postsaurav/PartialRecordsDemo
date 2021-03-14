tableextension 50001 ItemLedgerEntryExt2 extends "Item Ledger Entry"
{
    fields
    {
        field(50002; Ext2Int; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50003; Ext2Text; Text[1024])
        {
            DataClassification = CustomerContent;
        }
    }
}
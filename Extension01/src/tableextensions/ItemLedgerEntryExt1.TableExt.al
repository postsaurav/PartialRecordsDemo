tableextension 50000 ItemLedgerEntryExt1 extends "Item Ledger Entry"
{
    fields
    {
        field(50000; Ext1Int; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50001; Ext1Text; Text[1024])
        {
            DataClassification = CustomerContent;
        }
    }
}
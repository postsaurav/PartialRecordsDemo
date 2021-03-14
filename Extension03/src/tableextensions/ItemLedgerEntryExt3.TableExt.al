tableextension 50002 ItemLedgerEntryExt3 extends "Item Ledger Entry"
{
    fields
    {
        field(50004; Ext3Int; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50005; Ext3Text; Text[1024])
        {
            DataClassification = CustomerContent;
        }
    }
}
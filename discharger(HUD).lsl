/**
 * 番号をメッセージ文字列に変換します。
 * @function
 * @return string
 * @param integer
 */
string numToMessage(integer num)
{
    // 番号に応じた文字列を返す。
    if(num == 2) { return "Star"; }
    if(num == 3) { return "Flower"; }
    if(num == 4) { return "Heart"; }
    if(num == 5) { return "Soap"; }
    
    return "";
}
default
{
    state_entry()
    {
    }
    /**
     * ボタンが押されたときの処理。
     * @handler
     * @param integer
     */
    touch_start(integer total_number)
    {
        // 押されたプリムの番号を取る。
        integer num = llDetectedLinkNumber(0);
        
        // プリムにメッセージを送る。
        llRegionSayTo(llGetOwner(), 828203, numToMessage(num));
    }
    /**
     * 状態変化時の処理
     * @handler
     * @param integer
     */
    changed(integer change)
    {
        // 所有者が変更されたときはスクリプトをリセット
        if(change & CHANGED_OWNER) { llResetScript(); }
    }
}
/**
 * グローバル変数
 */
 integer g_nowDischarge = FALSE;
 integer g_listener;
 integer g_lastNum = 0;

/**
 * 初期化処理です。
 * @function
 */
init()
{
    // リスナを再構築
    llListenRemove(g_listener);
    g_listener = llListen(828203, "", NULL_KEY, "");
}
/**
 * 放出操作処理
 * @function
 * @param integer
 */
ctrlDischarge(integer num)
{
    // 同じボタンを２回押されたら停止。
    if(g_lastNum == num ) { num = 0; }
    
    // 放出終了のときは回転を止め、放出開始時は回転開始。
    if(num == 0) { llTargetOmega(ZERO_VECTOR, 0, 0); }
    else         { llTargetOmega(<0, 0, 6>, PI, 1); }
        
    // 小プリムにメッセージを送信する。
    llMessageLinked(LINK_ALL_CHILDREN, num, "", NULL_KEY);
    g_lastNum = num;
}
/**
 * メッセージを番号に変換します。
 * @function
 * @return integer
 * @param string
 */
integer msgToNumber(string msg)
{
    if(msg == "Star")   { return 1; }
    if(msg == "Flower") { return 2; }
    if(msg == "Heart")  { return 3; }
    if(msg == "Soap" )  { return 4; }
    
    return 0;
}
default
{
    state_entry()
    {
        // 初期化処理
        init();
    }
    /**
     * メッセージハンドラ
     * @handler
     * @param integer
     * @param string
     * @param key
     * @param string
     */
    listen(integer channel, string name, key id, string message)
    {
        // 放出を切り替える。
        ctrlDischarge(msgToNumber(message));
    }
    /**
     * 状態変更ハンドラ
     * @handler
     * @param integer
     */
    changed(integer change)
    {
        // 所有者が変わったら初期化処理。
        if(change & CHANGED_OWNER) { init(); }
    }
}
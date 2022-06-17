/**
 * 指定したテクスチャを放出します。
 * @function
 * @param textureName 放出するテクスチャ名
 */
 beginDischarge(string textureName)
 {
     // 放出を開始します。
     llParticleSystem([
         PSYS_PART_FLAGS,
         PSYS_PART_EMISSIVE_MASK | PSYS_PART_FOLLOW_VELOCITY_MASK,
         PSYS_SRC_PATTERN,
         PSYS_SRC_PATTERN_ANGLE,
         PSYS_SRC_ANGLE_BEGIN, 1,
         PSYS_SRC_MAX_AGE, 0,
         PSYS_PART_MAX_AGE, 5,
         PSYS_SRC_BURST_SPEED_MIN, 10,
         PSYS_PART_START_SCALE, <0.3, 0.3, 0>,
         PSYS_SRC_TEXTURE, textureName
         ]);
 }
 /**
  * 放出処理を停止します。
  * @function
  */
 stopDischarge()
 {
     // 放出の停止
     llParticleSystem([]);
 }
 /**
  * 指定された番号のテクスチャ名を取得します。
  * @function
  * @return string テクスチャ名
  * @param integer テクスチャ番号
  */
 string getTextureName(integer num)
 {
     // 番号に応じたテクスチャ名称を返す。
     if(num == 1) { return "GreenStar"; }
     if(num == 2) { return "GreenFlower"; }
     if(num == 3) { return "GreenHeart"; }
     if(num == 4) { return "GreenSoap"; }
     
     // 合致する番号がない場合は空文字列を返す。
     return "";
 }
 /**
  * デフォルトのState
  */
 default
 {
     /**
      * スクリプト起動ハンドラ
      * @handler
      */
     state_entry()
     {
         // 何もしない。
     }
     /**
      * オブジェクトクリックハンドラ
      * @handler
      * @param integer
      */
     touch_start(integer total_number)
     {
         // 何もしない。
     }
     /**
      * メッセージ受信ハンドラ
      * @handler
      * @param integer
      * @param integer
      * @param string
      * @param key
      */
     link_message(integer sender, integer num, string str, key id)
     {
         // 処理番号が0の場合は放出を停止する。
         if(num == 0) { stopDischarge(); return; }
         
         // テクスチャ名を取得して放出処理を起動。
         string textureName = getTextureName(num);
         beginDischarge(textureName);
     }
 } 
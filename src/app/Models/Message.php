<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    // 複数代入のブラックリスト
    // $guarded[ブラックリスト] <=> $fillable[ホワイトリスト]
    // 全属性を複数代入(createメソッド)可能にするため空の配列にする
    protected $guarded = [];
}

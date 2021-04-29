<?php

namespace App\Http\Controllers;

use App\Models\Message;
use DB;
use Exception;
use Illuminate\Http\Request;
use Storage;
use Str;

class MessageController extends Controller {
    public function store(Request $request) {
        $params = $request->json()->all();

        // list(,)で配列の最初を飛ばし';'以降を取得
        list(, $image) = explode(';', $params['image']);
        // list(,)で配列の最初を飛ばし','以降を取得
        list(, $image) = explode(',', $image);
        $decodedImage  = base64_decode($image);

        $content = $params['message'];
        // callback関数
        $id = DB::transaction(function () use ($decodedImage, $content) {
            $id   = Str::uuid();
            $file = $id->toString() . '.jpg';
            Message::create([
                'id'        => $id,
                'content'   => $content,
                'file_path' => $file,
            ]);

            $isSuccess = Storage::disk('s3')->put($file, $decodedImage);
            if (!$isSuccess) {
                throw new Exception('ファイルアップロード時にエラーが発生しました。');
            }
            // 外部からアクセス可能にする
            Storage::disk('s3')->setVisibility($file, 'public');

            return $id;
        });

        return response()->json($id);
    }
}

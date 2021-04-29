<?php

namespace App\Http\Controllers;

use App\Models\Message;
use DB;
use Exception;
use Illuminate\Http\Request;
use Str;

class MessageController extends Controller {
    public function store(Request $request) {
        $params  = $request->json()->all();
        $content = $params['message'];
        $id      = Str::uuid();

        $file = $id->toString() . '.jpg';

        Message::create([
            'id'        => $id,
            'content'   => $content,
            'file_path' => $file,
        ]);

        return response()->json($id);
    }
}

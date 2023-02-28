<?php
    namespace App\Http\Composers;
    use Illuminate\View\View;
    use Illuminate\Support\Facades\DB;

    class CateComposer{
        public function compose(View $view){
            $cate = DB::table('category')->get();
            $view -> with('cate',$cate);
        }
    }
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use TCG\Voyager\Models\Category;
use DB;
use Session;
use App\Giohang;

class AppServiceProvider extends ServiceProvider
{

    public function register()
    {
        //
    }


    public function boot()
    {
        view()->composer('layout.header', function($view){

            if(Session('cart')){
                $oldCart = Session::get('cart');
                $cart = new Giohang($oldCart);
                $nam = Category::where('order', 2)->get();
                $nu = Category::where('order', 1)->get();
                $view->with([
                    'cart'=>Session::get('cart'),
                    'product_cart'=>$cart->items,
                    'totalPrice'=>$cart->totalPrice,
                    'totalQty'=>$cart->totalQty,
                    'nam'=>$nam,
                    'nu'=>$nu
                ]);
            }else{
                $nam = Category::where('order', 2)->get();
                $nu = Category::where('order', 1)->get();
                $view->with([
                    'nam'=>$nam,
                    'nu'=>$nu
                ]);
            }
        });

        view()->composer('customer.giohang', function($view){
            if(Session('cart')){
                $oldCart = Session::get('cart');
                $cart = new Giohang($oldCart);
                $view->with([
                    'cart'=>Session::get('cart'),
                    'product_cart'=>$cart->items,
                    'totalPrice'=>$cart->totalPrice,
                    'totalQty'=>$cart->totalQty
                ]);
            }
        });

        view()->composer('customer.thanhtoan', function($view){
            if(Session('cart')){
                $oldCart = Session::get('cart');
                $cart = new Giohang($oldCart);
                $view->with([
                    'cart'=>Session::get('cart'),
                    'product_cart'=>$cart->items,
                    'totalPrice'=>$cart->totalPrice,
                    'totalQty'=>$cart->totalQty
                ]);
            }
        });

    }
}

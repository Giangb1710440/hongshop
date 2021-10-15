<?php

use App\Http\Controllers\VnpayController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;


//Route::get('/', function () {
//    return view('welcome');
//});

Route::get('/', 'App\Http\Controllers\HomeController@index')->name('home');
Route::get('/dangnhap', 'App\Http\Controllers\HomeController@dangnhap')->name('dangnhap');
Route::post('post-dang-nhap', [HomeController::class, 'postDangNhap'])->name('postDangNhap');
Route::post('/post-dang-ky', [HomeController::class, 'postDangKy'])->name('postDangKy');
Route::get('/dangky', [HomeController::class, 'dangky']);
Route::get('/xem-san-pham/{id}', [HomeController::class, 'xemSanPham']);
Route::get('/giohang', [HomeController::class, 'giohang'])->name('giohang');
Route::get('/lienhe', [HomeController::class, 'lienhe'])->name('lienhe');

Route::get('/dang-xuat', [HomeController::class, 'dangXuat'])->name('dangxuat');

Route::get('them-gio-hang/{id}', [HomeController::class, 'themGioHang'])->name('themGioHang');

Route::get('cap-nhat-gio-hang', [HomeController::class, 'updateCart'])->name('updateCart');

Route::get('xoa-gio-hang/{id}', [HomeController::class, 'deleteCart'])->name('deleteCart');

Route::get('thanh-toan', [HomeController::class, 'checkout'])->name('checkout');
Route::post('dat-hang', [HomeController::class, 'postCheckout'])->name('postCheckout');

Route::get('loai-san-pham/{loai}', [HomeController::class, 'loaiSanPham'])->name('loaiSanPham');

Route::post('post-rating-star/{userId}/{productId}', [HomeController::class, 'postRatingStar'])->name('postRatingStar');

Route::post('add-comment/{userId}/{productId}', [HomeController::class, 'addComment'])->name('addComment');

Route::get('profile/{userId}', [HomeController::class, 'getProfile'])->name('getProfile');
Route::put('update-profile/{userId}', [HomeController::class, 'updateProfile'])->name('updateProfile');

Route::get('change-password/{userId}', [HomeController::class, 'changePassword'])->name('changePassword');
Route::put('update-password/{userId}', [HomeController::class, 'updatePassword'])->name('updatePassword');

Route::get('search-product', [HomeController::class, 'searchProduct'])->name('searchProduct');

Route::get('view-category/{categoryId}', [HomeController::class, 'viewCategory'])->name('viewCategory');
Route::get('product-category/{id_cate}',[HomeController::class, 'viewCate_product'])->name('viewCate_product');
Route::get('page-store',[HomeController::class, 'page_store'])->name('page_store');

Route::group(['prefix' => 'admin'], function () {
    Route::get('browse-order/{id}', [HomeController::class, 'browseOrder'])->name('browseOrder');
    Route::get('cancel-order/{id}', [HomeController::class, 'cancelOrder'])->name('cancelOrder');
    Route::get('/revenue', [HomeController::class, 'revenue'])->name('revenue');
    Route::get('order-detail/{orderId}', [HomeController::class, 'orderDetail'])->name('orderDetail');
    Route::put('update-profile/{userId}', [HomeController::class, 'updateProfileAdmin'])->name('updateProfileAdmin');
    Voyager::routes();
});

Route::post('page-vnpay-checkout',[VnpayController::class,'create'])->name('checkout_vnpay');
Route::get('return-page-vnpay-checkout',[VnpayController::class,'return'])->name('return_checkout_vnpay');


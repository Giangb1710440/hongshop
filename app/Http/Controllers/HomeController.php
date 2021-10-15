<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Customer;
use App\DetailProduct;
use App\Order;
use App\OrderDetail;
use App\Product;
use App\RatingStar;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Session;
use Hash;
use validate;
use TCG\Voyager\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Giohang;

class HomeController extends Controller
{

    public function index()
    {
        $loai_sp = DB::table('categories')->take(5)->get();
        $loai_nam = DB::table('categories')->skip(6)->take(4)->get();
        $sps = DB::table('products')
            ->where('category_id', 3)
            ->orWhere('category_id', 1)->take(4)->get();

        $sp1 = DB::table('products')
            ->where('category_id', 6)
            ->orWhere('category_id', 7)->take(4)->get();
        return view('customer.index')->with([
            'loai_sp' => $loai_sp,
            'sps' => $sps,
            'sp1' => $sp1,
            'loai_nam' => $loai_nam
        ]);
    }

    public function loaiSanPham($loai){
        $loai_sp = DB::table('categories')->take(5)->get();
        $loai_nam = DB::table('categories')->skip(5)->take(4)->get();

        if($loai == 1 || $loai == 2 || $loai == 3 || $loai == 4 || $loai == 5){
            $sps = DB::table('products')
                    ->where('category_id', $loai)
                    ->get();

            $sp1 = DB::table('products')
                ->where('category_id', 6)
                ->orWhere('category_id', 7)->take(4)->get();
        }else{
            $sp1 = DB::table('products')
                ->where('category_id', $loai)
                ->get();

            $sps = DB::table('products')
                ->where('category_id', 3)
                ->orWhere('category_id', 1)->take(4)->get();
        }

        return view('customer.index')->with([
            'loai_sp' => $loai_sp,
            'sps' => $sps,
            'sp1' => $sp1,
            'loai_nam' => $loai_nam
        ]);
    }

    public function lienhe(){
        return view('customer.lienhe');
    }


    public function dangnhap()
    {
        return view('customer.dangnhap');
    }

    public function postDangNhap(Request $request){

        $email = $request->input('email');
        $password = $request->input('pass');

        $this->validate($request,
            [
                'email' => 'required',
                'pass' => 'required'
            ],[
                'email.required' => 'Vui lòng nhập email',
                'pass.required' => 'Vui lòng nhập mật khẩu',
            ]);

        if(Auth::attempt(['email' => $email, 'password' => $password, 'role_id' => 1])){
            return redirect()->route('voyager.dashboard');
        }elseif (Auth::attempt(['email' => $email, 'password' => $password, 'role_id' => 2])){
            return redirect()->route('home');
        }else{
            return redirect()->back()->with('message', 'Email hoặc mật khẩu của bạn không đúng!');
        }
    }

    public function dangXuat(){
        Auth::logout();
        return redirect()->route('home');
    }

    public function dangky()
    {
        return view('customer.dangky');
    }

    public function postDangKy(Request $request){
        $this->validate($request,
            [
                'email' => 'required|unique:users,email',
                'username' => 'required',
                'pass' => 'required',
                'con-pass' => 'required',
                'birthday' => 'required',
                'numberPhone' => 'required',
                'address' => 'required'
            ],[
                'email.unique' => 'Email đã tồn tại',
                'email.required' => 'Vui lòng nhập email',
                'username.required' => 'Vui lòng nhập tên đăng ký',
                'pass.required' => 'Vui lòng nhập mật khẩu',
                'con-pass.required' => 'Vui lòng xác nhận mật khẩu',
                'birthday.required' => 'Vui lòng nhập ngày sinh',
                'numberPhone.required' => 'Vui lòng nhập số điện thoại',
                'address.required' => 'Vui lòng nhập địa chỉ'
            ]);
        $pass = $request->input('pass');
        $con_pass = $request->input('con-pass');
        $user = new User;
        if($pass == $con_pass){
            $user->role_id = 2;
            $user->name = $request->input('username');
            $user->email  = $request->input('email');
            $user->password = Hash::make($pass);
            $user->birthday = $request->input('birthday');
            $user->phone = $request->input('numberPhone');
            $user->address = $request->input('address');
            $user->save();

            $register_success = Session::get('register_success');
            Session::put('register_success');

            return redirect()->route('dangnhap')->with('register_success','Đã đăng ký tài khoản thành công');
        }else{
            return redirect()->back()->with('message', 'Xác nhận mật khẩu không đúng');
        }
    }

    public function xemSanPham($id)
    {
        $sp = DB::table('products')->where('id', $id)->get();
        $ct_sp = DB::table('detail_products')->where('product_id', $id)->get();
        $mau = DB::table('color_products')->where('product_id', $id)->get();
        $size = DB::table('size_products')->where('product_id', $id)->get();
        return view('customer.xem_san_pham')->with([
            'sp' => $sp,
            'ct' => $ct_sp,
            'mau' => $mau,
            'size' => $size
        ]);
    }

    public function giohang(Request $request)
    {
        return view('customer.giohang');
    }


    public function thanhtoan()
    {
        return view('customer.thanhtoan');
    }

    public function themGioHang($id, Request $request){
        $product = DB::table('detail_products')->where('product_id', $id)->get();
        foreach ($product as $val){
            $sp = DetailProduct::find($val->id);
        }
        $oldCart = Session('cart')? Session::get('cart'):null;
        $cart = new Giohang($oldCart);
        $cart->add($sp , $id);
        $request->session()->put('cart', $cart);

        $add_cart_success = Session::get('add_cart_success');
        Session::put('add_cart_success');
        return redirect()->back()->with('add_cart_success', 'Đã thêm vào giỏ hàng');
    }

    public function updateCart(Request $request){
        if($request->id and $request->quantity){
            $oldCart = Session::has('cart')?Session::get('cart'):null;
            $cart = new Giohang($oldCart);
            $cart->update_cart($request->id,$request->quantity);
            session()->put('cart', $cart);
        }
    }

    public function deleteCart($id){
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Giohang($oldCart);
        $cart->removeItem($id);
        if(count($cart->items)>0){
            Session::put('cart', $cart);
        }else{
            Session::forget('cart');
        }
        $delete_cart = Session::get('delete_cart');
        Session::put('delete_cart');
        return redirect()->back()->with('delete_cart', 'Đã xóa sản phẩm ra khỏi giỏ hàng');
    }

    public function checkout(){
        return view('customer.thanhtoan');
    }

    public function postCheckout(Request $request){
        if ($request->input('type_pay') == 0){
            Session::put('non_cate_pay');
            return redirect()->back()->with('non_cate_pay','Chưa chọn hình thức thanh toán');
        }elseif ($request->input('type_pay') == 2){
            return view('customer.vnpay.index_vnpay')->with([
                'total_price'=>$request->input('totalPrice'),
                'fullname'=>$request->input('fullname'),
                'email'=>$request->input('email'),
                'phone'=>$request->input('phone'),
                'address'=>$request->input('address'),
            ]);
        }else{
            $cart = Session::get('cart');
            $id = $request->input('id'); //kiem tra xem có tai khoan chua
            $currentDate = Carbon::now();
            $requiredDate = $currentDate->addDays(6);

            if($id != -1){
                $order = new Order;
                $order->user_id = $id;
                $order->order_date = $currentDate;
                $order->require_date = $requiredDate;
                $order->total_money = $request->input('totalPrice');
                $order->save();
            }else{
                $customer = new Customer;
                $customer->fullname = $request->input('fullname');
                $customer->email = $request->input('email');
                $customer->phone = $request->input('phone');
                $customer->address = $request->input('address');
                $customer->save();

                $order = new Order;
                $order->customer_id = $customer->id;
                $order->order_date = $currentDate;
                $order->require_date = $requiredDate;
                $order->total_money = $request->input('totalPrice');
                $order->save();
            }

            foreach($cart->items as $key => $value){
                $order_detail = new OrderDetail;
                $order_detail->order_id = $order->id;
                $order_detail->product_id = $key;
                $order_detail->quantity = $value['qty'];
                $order_detail->price = ($value['price']/$value['qty']);
                $order_detail->save();
            }

            Session::forget('cart');
            $order_success = Session::get('order_success');
            Session::put('order_success');
            return redirect()->route('home')->with('order_success','Đặt hàng thành công');
        }


    }

    public function browseOrder($id){
        $order = DB::table('orders')
            ->where('id', $id)
            ->update(['status' => 1]);

        $browseOrder = Session::get('browseOrder');
        Session::put('browseOrder');

        return redirect()->back()->with('browseOrder','');
    }

    public function cancelOrder($id){
        $order = DB::table('orders')
            ->where('id', $id)
            ->update(['status' => 0]);

        $browseOrder = Session::get('browseOrder');
        Session::put('browseOrder');

        return redirect()->back()->with('browseOrder','');
    }

    public function postRatingStar($userId, $productId, Request $request){
        $get_count_rating = DB::table('rating_stars')->where([['user_id', '=', $userId], ['product_id', '=', $productId]])->count();
        if ($get_count_rating >= 1){
            Session::put('message_error');
            return redirect()->back()->with('message_error', 'Bạn đã đánh giá rồi!');
        }else{
            $add_rating = new RatingStar();
            $add_rating->rating_star = $request->input('rating');
            $add_rating->user_id = $userId;
            $add_rating->product_id = $productId;
            $add_rating->save();
            Session::put('message_success');
            return redirect()->back()->with('message_success', 'Đã đánh giá SAO');
        }
    }

    public function addComment($userId, $productId, Request $request){
        $comment = new Comment();
        $comment->user_id = $userId;
        $comment->product_id = $productId;
        $comment->content = $request->input('comment');
        $comment->save();
        Session::put('comment_success');
        return redirect()->back()->with('comment_success', 'Bình luận thành công');
    }

    public function getProfile($userId){
        $user = DB::table('users')->where('id', $userId)->first();
        return view('customer.profile')->with([
            'user' => $user
        ]);
    }

    public function updateProfile($userId, Request $request){
        $update_user = User::find($userId);
        $update_user->name = $request->input('inputUsername');
        $update_user->email = $request->input('inputEmail');
        $update_user->phone = $request->input('inputPhone');
        $update_user->birthday = $request->input('inputBirthday');
        $update_user->address = $request->input('inputAddress');

        if ($request->hasFile('fileInput')) {
            $file = $request->file('fileInput');
            $filename = $file->getClientOriginalName();
            $file->move(public_path('img/avatar/'), $filename);
            $update_user->avatar = $filename;
        }

        $update_user->save();
        return redirect()->back()->with('update_success', 'Đã cập nhật');
    }

    public function changePassword($userId){
        $change_pass = User::find($userId);
        return view('customer.change_password', ['user'=>$change_pass]);
    }

    public function updatePassword($userId, Request $request)
    {
        $old_pass = $request->input('inputPassOld');
        $new_pass = $request->input('inputPassNew');
        $new_pass_confirm = $request->input('inputPassConfirmNew');

        $change = User::find($userId);

        $user = DB::table('users')->where('id', $userId)->first();
        if(password_verify($old_pass,$user->password)){
            if($new_pass == $new_pass_confirm){
                $change->password = bcrypt($request->input('inputPassConfirmNew'));
                $change->save();
                return redirect()->route('getProfile', $change->id)->with('change_password_successfully', 'Đổi mật khẩu thành công');
            }else{
                return redirect()->back()->with('change_password_user_fail', 'Xác nhận mật khẩu sai!');
            }
        }else{
            return redirect()->back()->with('old_pass_fail','Mật khẩu cũ sai!');
        }
    }

    public function searchProduct(Request $request){
        $keyWord = $request->input('keyWord');
        $products = DB::table('products')->where('name_product', 'LIKE', '%'.$keyWord.'%')->get();
        $count = DB::table('products')->where('name_product', 'LIKE', '%'.$keyWord.'%')->count();
        return view('customer.search')->with([
            'products' => $products,
            'count' => $count
        ]);
    }

    public function viewCategory($categoryId){
        $products = DB::table('products')->where('category_id', $categoryId)->get();
        $count = DB::table('products')->where('category_id', $categoryId)->count();
        return view('customer.search')->with([
            'products' => $products,
            'count' => $count
        ]);
    }
    public function viewCate_product($cate_product){
        $products = DB::table('products')->get();
        $cate=DB::table('categories')->where('order',$cate_product)->get();
        return view('customer.product_cate')->with([
            'products' => $products,
            'cate' => $cate
        ]);
    }
    public function page_store(){
        $products = DB::table('products')->get();

        return view('customer.page_store')->with([
            'products' => $products
        ]);
    }



    public function revenue(){
        $orders = DB::table('orders')->get();
        return view('vendor.voyager.revenue.browse')->with([
            'orders' => $orders
        ]);
    }

    public function orderDetail($orderId){
        $order = DB::table('orders')->where('id', $orderId)->first();
        if($order->user_id != null){
            $customer = DB::table('users')->where('id', $order->user_id)->first();
        }else{
            $customer = DB::table('customers')->where('id', $order->customer_id)->first();
        }
        $orderDetail = DB::table('order_details')->where('order_id', $orderId)->get();
        $total = 0;
        foreach ($orderDetail as $item){
            $total += $total + ($item->price * $item->quantity);
        }
        return view('vendor.voyager.orders.order_detail')->with([
            'orderDetail' => $orderDetail,
            'order' => $order,
            'customer' => $customer,
            'total' => $total
        ]);
    }

}

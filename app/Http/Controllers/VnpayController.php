<?php

namespace App\Http\Controllers;

use App\Customer;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Session\Session;
use App\Order;
use App\OrderDetail;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
class VnpayController extends Controller
{


    public function create(Request $request)
    {
        $vnp_TmnCode = "UDOPNWS1"; //Mã website tại VNPAY
        $vnp_HashSecret = "EBAHADUGCOEWYXCMYZRMTMLSHGKNRPBN"; //Chuỗi bí mật
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = "http://localhost/hongshop/return-page-vnpay-checkout";
        $vnp_TxnRef = date("YmdHis"); //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = $request->input('order_desc');//noi dung thanh toan
        $vnp_OrderType = 200000; //ma loai san pham thanh toan
        $vnp_Amount = $request->input('amount') * 100;

        $vnp_BankCode = $request->input('bank_code');
        $vnp_Locale = 'vn';
        $vnp_IpAddr = request()->ip();

        $inputData = array(
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . $key . "=" . $value;
            } else {
                $hashdata .= $key . "=" . $value;
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url."?".$query;
        if (isset($vnp_HashSecret)) {
            // $vnpSecureHash = md5($vnp_HashSecret . $hashdata);
            $vnpSecureHash = hash('sha256', $vnp_HashSecret . $hashdata);
            $vnp_Url .= 'vnp_SecureHashType=SHA256&vnp_SecureHash=' . $vnpSecureHash;
        }
        if($request->input('id_user') == -1){

            Session()->put('isset_id_user',-1);
            Session()->put('fullname_c',$request->input('txt_billing_fullname'));
            Session()->put('sdt_c',$request->input('txt_billing_mobile'));
            Session()->put('email_c',$request->input('txt_billing_email'));
            Session()->put('address_c',$request->input('txt_billing_addr1'));
        }else{
            Session()->put('isset_id_user',Auth::user()->id);

        }

        return redirect($vnp_Url);
    }

    public function return(Request $request)
    {
            $cart = Session()->get('cart');
            $currentDate = Carbon::now();
            $requiredDate = $currentDate->addDays(6);
//        $url = session('url_prev','/');
        if($request->vnp_ResponseCode == "00") {
            if(Session()->get('isset_id_user') == -1){
                $customer = new Customer();
                $customer->fullname = $request->input('fullname_c');
                $customer->email = $request->input('email_c');
                $customer->phone = $request->input('sdt_c');
                $customer->address = $request->input('address_c');
                $customer->save();

                $order = new Order();
                $order->customer_id = $customer->id;
                $order->order_date = $currentDate;
                $order->require_date = $requiredDate;
                $order->status = 3;
                $order->total_money = $cart->totalPrice;
                $order->save();
            }else{
                $order = new Order();
                $order->user_id = Session()->get('isset_id_user');
                $order->order_date = $currentDate;
                $order->require_date = $requiredDate;
                $order->status = 3;
                $order->total_money = $cart->totalPrice;
                $order->save();
            }
            foreach($cart->items as $key => $value){
                $order_detail = new OrderDetail();
                $order_detail->order_id = $order->id;
                $order_detail->product_id = $key;
                $order_detail->quantity = $value['qty'];
                $order_detail->price = ($value['price']/$value['qty']);
                $order_detail->save();
            }
            Session()->forget('cart');
            return redirect()->route('home')->with('success' ,'Đã thanh toán phí dịch vụ');
        }
        return redirect()->route('checkout')->with('errors' ,'Lỗi trong quá trình thanh toán phí dịch vụ');

    }
}

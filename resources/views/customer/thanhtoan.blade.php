@extends('layout.master')
@section('title', 'Thanh toán')
@section('content')
    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="{{ route('postCheckout') }}" class="checkout-form" method="post">
                @csrf

                <div class="row">
                    <div class="col-lg-6">
                        <h4>Thông tin khách hàng</h4>
                        @if(Auth::check())
                        <div class="row">
                            <div class="col-lg-6">
                                <label for="fir">Họ và tên<span>*</span></label>
                                <input type="text" id="fullname" name="fullname" value="{{ Auth::user()->name }}">
                            </div>
                            <div class="col-lg-6">
                                <label for="cun-name">Số điện thoại<span>*</span></label>
                                <input type="text" id="phone" name="phone" value="{{ Auth::user()->phone }}">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun">Email<span>*</span></label>
                                <input type="text" id="email" name="email" value="{{ Auth::user()->email }}">
                            </div>
                            <div class="col-lg-12">
                                <label for="email">Địa chỉ cụ thể<span>*</span></label>
                                <input type="text" id="address" name="address" value="{{ Auth::user()->address }}" >
                            </div>
                            <input type="hidden" id="id" name="id" value="{{ Auth::user()->id }}">
                        </div>
                        @else
                            <div class="row">
                                <div class="col-lg-6">
                                    <label for="fir">Họ và tên<span>*</span></label>
                                    <input type="text" id="fullname" name="fullname" value="">
                                </div>
                                <div class="col-lg-6">
                                    <label for="cun-name">Số điện thoại<span>*</span></label>
                                    <input type="text" id="phone" name="phone" value="">
                                </div>
                                <div class="col-lg-12">
                                    <label for="cun">Email<span>*</span></label>
                                    <input type="text" id="email" name="email" value="">
                                </div>
                                <div class="col-lg-12">
                                    <label for="email">Địa chỉ cụ thể<span>*</span></label>
                                    <input type="text" id="address" name="address" value="">
                                </div>
                                <input type="hidden" id="id" name="id" value="-1">
                                <div class="col-lg-12">
                                    <div class="create-item">
                                        <label for="acc-create">
                                            Bạn đã có tài khoản ?
                                            <input type="checkbox" id="acc-create">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>Đơn hàng</h4>
                            @if(Session::has('cart'))
                                <div class="order-total">
                                    <ul class="order-table">
                                        <li>Sản phẩm <span>Tổng tiền</span></li>
                                        @foreach($product_cart as $product)
                                            <li class="fw-normal">
                                                @php($name = DB::table('products')->where('id', $product['item']['product_id'])->get())
                                                @foreach($name as $name)
                                                    {{ $name->name_product }}
                                                @endforeach
                                                x {{ $product['qty'] }} đ
                                                <span>{{ number_format($product['qty'] * $product['item']['price']) }} đ</span>
                                            </li>
                                        @endforeach
                                        <li class="fw-normal">Tổng tiền:
                                            <span style="color: red;">{{ number_format($totalPrice) }} đ</span>
                                            <input type="hidden" id="totalPrice" name="totalPrice" value="{{ $totalPrice }}">
                                        </li>
                                    </ul>
                                    <div class="payment-check">
                                        <div class="col-lg-12">
                                            <label for="email">Phương thức thanh toán</label>
                                            <select class="checkmark" name="type_pay" id="type_pay">
                                                <option value="0">Chọn .. </option>
                                                <option value="1">Thanh toán khi nhận hàng</option>
                                                <option value="2">Thanh toán VNpay</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="order-btn">
                                        <button type="submit" class="site-btn place-btn">Đặt hàng</button>
                                    </div>
                                </div>
                            @else
                                <div class="order-total">
                                    <h3>Không có sản phẩm trong giỏ hàng</h3>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <script>
        var msg1 = '{{Session::get('order_success')}}';
        var exist1 = '{{Session::has('order_success')}}';
        if(exist1){
            swal({
                title: "Đặt hàng thành công.",
                text: "",
                type: "success",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',
            });
        }
    </script>
    <script>
        var msg1 = '{{Session::get('non_cate_pay')}}';
        var exist1 = '{{Session::has('non_cate_pay')}}';
        if(exist1){
            swal({
                title: "Chưa chọn hình thức đặt hàng.",
                text: "",
                type: "info",
                timer: 1200,
                showConfirmButton: false,
                position: 'top-end',
            });
        }
    </script>
    <script>
        var msg = '{{Session::get('errors')}}';
        var exist = '{{Session::has('errors')}}';
        if(exist){
            swal({
                title: "Xãy ra lỗi, hãy kiểm tra lại",
                text: "",
                type: "error",
                timer: 3000,
                showConfirmButton: false,
                position: 'top-end',
            });
        }
    </script>
@endsection

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header-section">
        <div class="inner-header">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="logo">
                        <a href="{{ url('/') }}">
                            <span>PINK</span> <span class="red">SHOES</span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="advanced-search">
                        <div class="input-group">
                            <input type="text" placeholder="Bạn cần gì?">
                            <button type="button"><i class="ti-search"></i></button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 text-right col-md-3">
                    <ul class="nav-right">
                        @if(Auth::check())
                            <style>
                                .dropdown{
                                    float: left;
                                }
                            </style>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    {{ Auth::user()->name }}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    {{--<a class="dropdown-item" href="#">Thông tin</a>--}}
                                    <a class="dropdown-item" href="{{ route('dangxuat') }}">Đăng xuất</a>
                                </div>
                            </div>

                            <li class="cart-icon" style="margin-right: 80px;">
                                <a href="#">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                    @if(Session::has('cart'))
                                        <span>{{Session('cart')->totalQty}}</span>
                                    @else
                                        <span>0</span>
                                    @endif
                                </a>
                                @if(Session::has('cart'))
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                            @foreach($product_cart as $product)
                                                <tr>
                                                    <td class="si-pic">
                                                        @foreach((array)json_decode($product['item']['image'], true) as $image)
                                                            <img style="width: 80px; height: 80px;" src="{{ voyager::image($image) }}" alt="">
                                                            @break
                                                        @endforeach
                                                    </td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>{{ number_format($product['item']['price']) }} x {{ $product['qty'] }}</p>
                                                            <h6>{{ $product['item']['name'] }}</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>tổng tiền:</span>
                                        <h5>{{ number_format($totalPrice) }} đ</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="{{ route('giohang') }}" class="primary-btn view-card">Xem giỏ hàng</a>
                                        <a href="{{ route('checkout') }}" class="primary-btn checkout-btn">Thanh toán</a>
                                    </div>
                                </div>
                                @endif
                            </li>

                        @else
                            <li class="cart-icon">
                                <a href="#">
                                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                                    @if(Session::has('cart'))
                                        <span>{{Session('cart')->totalQty}}</span>
                                    @else
                                        <span>0</span>
                                    @endif
                                </a>
                                @if(Session::has('cart'))
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                            @foreach($product_cart as $product)
                                                <tr>
                                                    <td class="si-pic">
                                                        @foreach((array)json_decode($product['item']['image'], true) as $image)
                                                            <img style="width: 80px; height: 80px;" src="{{ voyager::image($image) }}" alt="">
                                                            @break
                                                        @endforeach
                                                    </td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>{{ number_format($product['item']['price']) }} x {{ $product['qty'] }}</p>
                                                            <h6>{{ $product['item']['name'] }}</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                            @endforeach

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>tổng tiền:</span>
                                        <h5>{{ number_format($totalPrice) }} đ</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="{{ route('giohang') }}" class="primary-btn view-card">Xem giỏ hàng</a>
                                        <a href="{{ route('checkout') }}" class="primary-btn checkout-btn">Đặt hàng</a>
                                    </div>
                                </div>
                                @endif
                            </li>

                            <li>
                                <a href="{{url('/dangnhap')}}" class="btn btn-primary">
                                    <i class="fa fa-user" aria-hidden="true"></i> Đăng nhập
</a>
                            </li>

                            <li>
                                <a href="{{ url('/dangky') }}" class="btn btn-info">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Đăng ký
                                </a>
                            </li>

                        @endif

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="nav-item">
        <div class="container">
            <nav class="nav-menu mobile-menu">
                <ul>
                    <li class="active"><a href="{{ url('/') }}">Trang chủ</a></li>
                    <li><a href="">Cửa hàng</a></li>
                    <li><a href="#">Sản phẩm <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                        <ul class="dropdown" style="width: 204px">
                            <li><a href="#">Giày Nam</a></li>
                                @foreach($nam as $nam)
                                    <li class="active"><a style="padding-left: 10px;font-size: 16px; font-family: 'Times New Roman';font-weight: normal" href="#">{{ $nam->name }}</a></li>
                                @endforeach

                            <li><a href="#">Giày Nữ</a></li>
                                @foreach($nu as $nu)
                                    <li class="active">
                                        <a style="padding-left: 10px;font-size: 16px; font-family: 'Times New Roman';font-weight: normal" href="#">{{ $nu->name }}</a></li>
                                @endforeach
                        </ul>
                    </li>
                    <li><a href="{{ route('lienhe') }}">Liên Hệ</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
</header>
<!-- Header End -->

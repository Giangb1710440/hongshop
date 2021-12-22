@extends('layout.master')
@section('title', 'Đăng ký')
@section('content')

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>Đăng ký</h2>

                        @if(session()->has('message'))
                            <div class="alert alert-success">
                                {{ session()->get('message') }}
                            </div>
                        @endif

                        <form action="{{ route('postDangKy') }}" method="post" enctype="multipart/form-data">
                            @csrf

                            <div class="group-input">
                                <label for="username">Tên đăng ký *</label>
                                <input type="text" id="username" name="username">
                                <strong style="color: red;">{{ $errors->first('username') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="username">Email *</label>
                                <input type="text" id="email" name="email" onblur="return isEmail()">
                                <strong style="color: red;">{{ $errors->first('email') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="pass">Mật khẩu *</label>
                                <input type="password" id="pass" name="pass">
                                <strong style="color: red;">{{ $errors->first('pass') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="con-pass">Nhập lại mật khẩu *</label>
                                <input type="password" id="con-pass" name="con-pass">
                                <strong style="color: red;">{{ $errors->first('con-pass') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="con-pass">Ngày sinh *</label>
                                <input type="date" id="birthday" name="birthday">
                                <strong style="color: red;">{{ $errors->first('birthday') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="con-pass">Số điện thoại *</label>
                                <input type="text" id="numberPhone" name="numberPhone" onblur="return Test_numberphone()">
                                <strong style="color: red;">{{ $errors->first('numberPhone') }}</strong>
                            </div>
                            <div class="group-input">
                                <label for="con-pass">Địa chỉ *</label>
                                <textarea name="address" id="address" cols="59%" rows="5"></textarea>
                                <strong style="color: red;">{{ $errors->first('address') }}</strong>
                            </div>
                            <button type="submit" class="site-btn register-btn">Đăng ký</button>
                        </form>
                        <div class="switch-login">
                            <a href="{{ url('/dangnhap') }}" class="or-login">Hoặc Đăng nhập</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function Test_numberphone(){
            var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
            var mobile = $('#numberPhone').val();
            if(mobile !==''){
                if (vnf_regex.test(mobile) == false)
                {
                    alert('Số điện thoại không đúng định dạng. Vui lòng nhập lại');
                }
            }
        }
        function isEmail() {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var email = $('#email').val();
            if(email !==''){
                if(regex.test(email) == false){
                    alert('Email không đúng định dạng. Vui lòng nhập lại');
                }
            }
        }
    </script>

@endsection

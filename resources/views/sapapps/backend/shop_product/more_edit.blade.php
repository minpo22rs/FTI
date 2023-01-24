@extends('traceon.backend.inc.template')

@push('styles')
<!--forms-wizard css-->
<link rel="stylesheet" type="text/css" href="{!! asset('public/backend/files/bower_components/jquery.steps/css/jquery.steps.css') !!}">
<!-- Custom css -->
<link rel="stylesheet" type="text/css" href="{!! asset('resources/css/app.css') !!}">
<style>
    .wizard.vertical > .content {
        height: 700px !important;
    }
</style>
@endpush

@section('content')
<div class="pcoded-content">
    <div class="pcoded-inner-content">
        <!-- Main-body start -->
        <div class="main-body">
            <div class="page-wrapper">
                <!-- Page body start -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            @include('traceon.backend.inc.alert')
                            <!-- Verticle Wizard card start -->
                            <div class="card">
                                <div class="card-block">
                                    <h5 class="m-b-10">{{ $menu }}</h5>
                                    <p class="text-muted m-b-10"><code>แก้ไขข้อมูล</code></p>
                                    <ul class="breadcrumb-title b-t-default p-t-10">
                                        <li class="breadcrumb-item">
                                            <a href="{!! url("backend/$url") !!}""> <i class="fa fa-home"></i> </a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#!">Frontend</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#!">Shop</a>
                                        </li>
                                        <li class="breadcrumb-item"><a href="#!">{{ $menu }}</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="wizardb">
                                                <section>
                                                    <form class="wizard-form" id="verticle-wizard-validate" action="{{url('/backend/'.$url.'/'.$ref_id.'/more/'.$id)}}" method="POST" enctype="multipart/form-data">
                                                        <input name="_method" type="hidden" value="PUT">
                                                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                                                        <h3> Basic Info </h3>
                                                        <fieldset>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <button class="btn btn-grd-warning" id="back" data-toggle="tooltip" data-original-title="คลิ๊กเพื่อย้อนกลับไปหน้ารายการ"><i class="icofont icofont-line-block-left"></i>ย้อนกลับ</button>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-12">Active</label>
                                                                <div class="col-sm-12">
                                                                    <div class="form-radio">
                                                                        <div class="radio radiofill radio-primary radio-inline">
                                                                            <label>
                                                                                <input type="radio" name="more_active" value="1" data-bv-field="more_active" 
                                                                                {{ old('more_active') == '1' ? 'checked' : ($rec->more_active == '1' ? 'checked' : '') }}>
                                                                                <i class="helper"></i>On
                                                                            </label>
                                                                        </div>
                                                                        <div class="radio radiofill radio-primary radio-inline">
                                                                            <label>
                                                                                <input type="radio" name="more_active" value="0" data-bv-field="more_active" 
                                                                                {{ old('more_active') == '0' ? 'checked' : ($rec->more_active == '0' ? 'checked' : '') }}>
                                                                                <i class="helper"></i>Off
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <span class="messages"></span>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">Sort</label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <input name="more_sort" type="text" class="form-control" data-toggle="tooltip" data-original-title="ใส่เลขเพื่อเรียงลำดับ 1 - 99" data-placement="left"
                                                                    value="{{ old('more_sort') ? old('more_sort') : $rec->more_sort }}" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">Sort</label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <select name="more_type" class="form-control">
                                                                        {!! App\Model\front_shop::more_type_option_html( $rec->more_type ) !!} 
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <h3>Details EN</h3>
                                                        <fieldset>
                                                        <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">Topic <span class="text-danger ">*</span></label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <input name="more_topic" type="text" class="form-control" value="{{ old('more_topic') ? old('more_topic') : $rec->more_topic }}" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">Content </label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <textarea name="more_content" class="form-control">{!! old('more_content') ? old('more_content') : $rec->more_content !!}</textarea>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <h3>Details TH</h3>
                                                        <fieldset>
                                                        <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">หัวข้อ <span class="text-danger ">*</span></label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <input name="more_topic_th" type="text" class="form-control" value="{{ old('more_topic_th') ? old('more_topic_th') : $rec->more_topic_th }}" >
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">เนื้อหา </label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <textarea name="more_content_th" class="form-control">{!! old('more_content_th') ? old('more_content_th') : $rec->more_content_th !!}</textarea>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <h3>more</h3>
                                                        <fieldset>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <label class="block">more </label>
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <img  name="more_img_name" style="max-height:150px; max-width:100%; display:block;" class="m-b-5" 
                                                                    src="{{ url('storage/app/public/image/more/'.$rec->more_img_name)  }}">
                                                                    <input name="more_img_name" type="file"  class="form-control img" data-toggle="tooltip" data-original-title="เลือกไฟล์ภาพจากในเครื่อง ขนาดภาพ 1600 x 57px เพื่อให้ภาพแสดงผลได้ถูกต้อง" data-placement="left"
                                                                    value="{{ old('more_img_name') ? old('more_img_name') : $rec->more_img_name }}" >
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                    </form>
                                                </section>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Verticle Wizard card end -->
                        </div>
                    </div>
                </div>
                <!-- Page body end -->
            </div>
        </div>
        <!-- Main-body end -->

        <div id="styleSelector">

        </div>
    </div>
</div>
@stop


@push('scripts')
<!--Forms - Wizard js-->
<script src="{!! asset('public/backend/files/bower_components/jquery.cookie/js/jquery.cookie.js') !!}"></script>
<script src="{!! asset('public/backend/files/bower_components/jquery.steps/js/jquery.steps.js') !!}"></script>
<script src="{!! asset('public/backend/files/bower_components/jquery-validation/js/jquery.validate.js') !!}"></script>
<!-- Validation js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script  src="{!! asset('public/backend/files/assets/pages/form-validation/validate.js') !!}"></script>
<!-- Custom js -->
<script src="{!! asset('public/backend/files/assets/pages/forms-wizard-validation/form-wizard.js') !!}"></script>
<script src="{!! asset('public/backend/ckeditor/ckeditor.js') !!}"></script>
<script src="{!! asset('public/backend/ckeditor/adapters/jquery.js') !!}"></script>
<script src="{!! asset('resources/js/app.js') !!}"></script>


<script type="text/javascript">
    $(document).ready(function(){
        	

        /////////////// Event ///////////////////////
        window.browse_img_preview('img[name="more_img_name"]');

        setTimeout(function(){
            var token = '{!! csrf_token() !!}';
            var url = '{!! asset('') !!}';
            window.ckeditor(token,url,'textarea[name="more_content"]','100%','350');
            window.ckeditor(token,url,'textarea[name="more_content_th"]','100%','350');
        },1000);

        /////////////// Fixed ///////////////////////
        window.back('{!! url("backend/$url/$ref_id/more") !!}');
        window.validate_step('#verticle-wizard-validate');
        
    });
</script>
@endpush
    


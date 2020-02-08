{if $loginpage eq 0 and $templatefile ne "clientregister"}
                        </div><!-- /.main-content -->
                <div class="col-md-3 pull-md-right sidebar">
                {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                    <div>
                        {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                    </div>
                {/if}
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</section>
</div>
<div id="message2" class="container-fluid message-area normal-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <div class="text-purple-light">نیاز به پشتیبانی دارید ؟</div>
                <div class="text-purple-dark">ما آماده ایم به سوالات شما پاسخ دهیم !</div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div class="buttons-holder">
                    <a href="{$WEB_ROOT}/register.php" class="ybtn ybtn-purple">ثبت نام </a><a href="{$WEB_ROOT}/contact.php" class="ybtn ybtn-white ybtn-shadow">تماس با ما</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer" class="container-fluid">
    <div class="container footer_">
                <div class="footer-menu-holder">
                    <p>کلیه حقوق مادی و معنوی این سایت متعلق به شرکت آذران وب می باشد.<img class="mylog" src="../templates/Ahoura/images/logo110.png"/></p>
                </div>
    </div>
</div>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content panel panel-primary">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">بستن</span>
                </button>
                <h4 class="modal-title">عنوان</h4>
            </div>
            <div class="modal-body panel-body">
               در حال بارگزاری ...
            </div>
            <div class="modal-footer panel-footer">
                <div class="pull-right loader">
                    <i class="fa fa-circle-o-notch fa-spin"></i> در حال بارگزاری ...
                </div>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    بستن
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    ارسال
                </button>
            </div>
        </div>
    </div>
</div>
{/if}
{if $templatefile eq "clientregister"}
<script>
    $(window).on("load", function() {
        $("select").addClass("selectpicker");
    });
</script>
<script src="{$WEB_ROOT}/templates/{$template}/js/bootstrap-select.min.js"></script>
{/if}
<script src="{$WEB_ROOT}/templates/{$template}/js/bootstrap-slider.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/slick.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/js/main.js"></script>

{$footeroutput}

</body>
</html>

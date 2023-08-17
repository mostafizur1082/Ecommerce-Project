<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Backend\AdminProfileController;
use App\Http\Controllers\Backend\BrandController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\CouponController;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\ReportController;
use App\Http\Controllers\Backend\ShippingAreaController;
use App\Http\Controllers\Backend\SliderController;
use App\Http\Controllers\Backend\SubCategoryController;
use App\Http\Controllers\Backend\SubSubCategoryController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\IndexController;
use App\Http\Controllers\Frontend\LanguageController;
use App\Http\Controllers\User\AllUserController;
use App\Http\Controllers\User\CartPageController;
use App\Http\Controllers\User\CashController;
use App\Http\Controllers\User\CheckoutController;
use App\Http\Controllers\User\StripeController;
use App\Http\Controllers\User\WishlistController;
use App\Models\User;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/




Route::group(['prefix'=> 'admin', 'middleware'=>['admin:admin']], function(){
    Route::get('/login', [AdminController::class, 'loginForm']);
    Route::post('/login',[AdminController::class, 'store'])->name('admin.login');
});


Route::middleware(['auth:admin'])->group(function(){

Route::middleware(['auth:sanctum,admin', config('jetstream.auth_session'), 'verified'])->get('/admin/dashboard', function () {
    return view('admin.index');
})->name('admin.dashboard')->middleware('auth:admin');

Route::get('admin/logout',[AdminController::class, 'destroy'])->name('admin.logout');
Route::get('admin/profile',[AdminProfileController::class, 'adminprofile'])->name('admin.profile');
Route::get('admin/profile/edit',[AdminProfileController::class, 'adminprofileedit'])->name('admin.profile.edit');
Route::post('admin/profile/edit',[AdminProfileController::class, 'adminprofilestore'])->name('admin.profile.store');
Route::get('admin/change/password',[AdminProfileController::class, 'adminchangepassword'])->name('admin.change.password');
Route::post('update/change/password',[AdminProfileController::class, 'adminupdatepassword'])->name('update.change.password');


});  // end Middleware admin



// uaer all route

Route::middleware(['auth:sanctum,web', config('jetstream.auth_session'), 'verified'])->get('/dashboard', function () {
    $id = Auth::user()->id;
    $user = User::find($id);
    return view('dashboard',compact('user'));
})->name('dashboard');


// user profile
Route::get('/', [IndexController::class, 'index']);
Route::get('/user/logout', [IndexController::class, 'userLogout'])->name('user.logout');
Route::get('/user/profile', [IndexController::class, 'userProfile'])->name('user.profile');
Route::post('/user/profile/store', [IndexController::class, 'userProfileStore'])->name('user.profile.store');

Route::post('/user/profile/store', [IndexController::class, 'userProfileStore'])->name('user.profile.store');
Route::get('/user/change/password', [IndexController::class, 'userChangePassword'])->name('change.password');
Route::post('/user/update/password', [IndexController::class, 'userUpdatePassword'])->name('user.update.password');


// brand all route

Route::prefix('brand')->group(function(){
Route::get('/view', [BrandController::class, 'brandView'])->name('all.brand');
Route::post('/store', [BrandController::class, 'brandStore'])->name('brand.store');
Route::get('edit/{id}', [BrandController::class, 'brandEdit'])->name('brand.edit');
Route::post('/update', [BrandController::class, 'brandUpdate'])->name('brand.update');
Route::get('/delete/{id}', [BrandController::class, 'brandDelete'])->name('brand.delete');
});


// Category all route

Route::prefix('category')->group(function(){
Route::get('/view', [CategoryController::class, 'categoryView'])->name('all.category');
Route::post('/store', [CategoryController::class, 'categoryStore'])->name('category.store');
Route::get('edit/{id}', [CategoryController::class, 'categoryEdit'])->name('category.edit');
Route::post('/update', [CategoryController::class, 'categoryUpdate'])->name('category.update');
Route::get('/delete/{id}', [CategoryController::class, 'categoryDelete'])->name('category.delete');

// SubCategory all route
Route::get('/sub/view', [SubCategoryController::class, 'SubCategoryView'])->name('all.subcategory');
Route::post('/sub/store', [SubCategoryController::class, 'SubCategoryStore'])->name('subcategory.store');
Route::get('/sub/edit/{id}', [SubCategoryController::class, 'SubCategoryEdit'])->name('subcategory.edit');
Route::post('/sub/update', [SubCategoryController::class, 'SubCategoryUpdate'])->name('subcategory.update');
Route::get('/sub/delete/{id}', [SubCategoryController::class, 'SubCategoryDelete'])->name('subcategory.delete');

// SubSubCategory all route
Route::get('/sub/sub/view', [SubSubCategoryController::class, 'SubSubCategoryView'])->name('all.subsubcategory');
Route::get('/subcategory/ajax/{category_id}', [SubSubCategoryController::class, 'GetSubCategory']);

Route::get('/sub-subcategory/ajax/{subcategory_id}', [SubSubCategoryController::class, 'GetSubSubCategory']);
Route::post('/sub/sub/store', [SubSubCategoryController::class, 'SubSubCategoryStore'])->name('subsubcategory.store');
Route::get('/sub/sub/edit/{id}', [SubSubCategoryController::class, 'SubSubCategoryEdit'])->name('subsubcategory.edit');
Route::post('/sub/sub/update', [SubSubCategoryController::class, 'SubSubCategoryUpdate'])->name('subsubcategory.update');
Route::get('/sub/sub/delete/{id}', [SubSubCategoryController::class, 'SubSubCategoryDelete'])->name('subsubcategory.delete');
});


// product all route

Route::prefix('product')->group(function(){
Route::get('/add', [ProductController::class, 'addProduct'])->name('add.product');
Route::post('/store', [ProductController::class, 'StoreProduct'])->name('product-store');
Route::get('/manage', [ProductController::class, 'ManageProduct'])->name('manage-product');
Route::get('/edit/{id}', [ProductController::class, 'EditProduct'])->name('product.edit');
Route::get('/details/{id}', [ProductController::class, 'ViewProduct'])->name('product.details');
Route::post('/data/update', [ProductController::class, 'ProductDataUpdate'])->name('product-update');
Route::post('/image/update', [ProductController::class, 'MultiImageUpdate'])->name('update-product-image');
Route::post('/thambnail/update', [ProductController::class, 'ThambnailImageUpdate'])->name('update-product-thambnail');
Route::get('/multiimg/delete/{id}', [ProductController::class, 'MultiImageDelete'])->name('product.multiimg.delete');
Route::get('/inactive/{id}', [ProductController::class, 'ProductInactive'])->name('product.inactive');

Route::get('/active/{id}', [ProductController::class, 'ProductActive'])->name('product.active');
Route::get('/delete/{id}', [ProductController::class, 'ProductDelete'])->name('product.delete');
});


// Admin Slider All Routes 

Route::prefix('slider')->group(function(){

Route::get('/view', [SliderController::class, 'SliderView'])->name('manage-slider');

Route::post('/store', [SliderController::class, 'SliderStore'])->name('slider.store');

Route::get('/edit/{id}', [SliderController::class, 'SliderEdit'])->name('slider.edit');

Route::post('/update', [SliderController::class, 'SliderUpdate'])->name('slider.update');

Route::get('/delete/{id}', [SliderController::class, 'SliderDelete'])->name('slider.delete');

Route::get('/inactive/{id}', [SliderController::class, 'SliderInactive'])->name('slider.inactive');

Route::get('/active/{id}', [SliderController::class, 'SliderActive'])->name('slider.active');

});


// Frontend all route

// multi language all route

Route::get('/language/bangla', [LanguageController::class, 'Bangla'])->name('bangla.language');

Route::get('/language/english', [LanguageController::class, 'English'])->name('english.language');


// Frontend Product Details Page url 
Route::get('/product/details/{id}/{slug}', [IndexController::class, 'ProductDetails']);
// Frontend Product Tags Page 
Route::get('/product/tag/{tag}', [IndexController::class, 'TagWiseProduct']);

// Frontend SubCategory wise Data
Route::get('/subcategory/product/{subcat_id}/{slug}', [IndexController::class, 'SubCatWiseProduct']);

// Frontend Sub-SubCategory wise Data
Route::get('/subsubcategory/product/{subsubcat_id}/{slug}', [IndexController::class, 'SubSubCatWiseProduct']);

// Product View Modal with Ajax
Route::get('/product/view/modal/{id}', [IndexController::class, 'ProductViewAjax']);

// Add to Cart Store Data
Route::post('/cart/data/store/{id}', [CartController::class, 'AddToCart']);

// Get Data from mini cart
Route::get('/product/mini/cart/', [CartController::class, 'AddMiniCart']);

// Remove mini cart
Route::get('/minicart/product-remove/{rowId}', [CartController::class, 'RemoveMiniCart']);


// Add to Wishlist
Route::post('/add-to-wishlist/{product_id}', [CartController::class, 'AddToWishlist']);

// Wishlist page
Route::group(['prefix'=>'user','middleware' => ['user','auth'],'namespace'=>'User'],function(){
Route::get('/wishlist', [WishlistController::class, 'ViewWishlist'])->name('wishlist');
Route::get('/get-wishlist-product', [WishlistController::class, 'GetWishlistProduct']);
Route::get('/wishlist-remove/{id}', [WishlistController::class, 'RemoveWishlistProduct']);

Route::post('/stripe/order', [StripeController::class, 'StripeOrder'])->name('stripe.order');
Route::post('/cash/order', [CashController::class, 'CashOrder'])->name('cash.order');

// User Order
Route::get('/my/orders', [AllUserController::class, 'MyOrders'])->name('my.orders');
Route::get('/order_details/{order_id}', [AllUserController::class, 'OrderDetails']);
Route::get('/invoice_download/{order_id}', [AllUserController::class, 'InvoiceDownload']);


Route::post('/return/order/{order_id}', [AllUserController::class, 'ReturnOrder'])->name('return.order');
Route::get('/return/order/list', [AllUserController::class, 'ReturnOrderList'])->name('return.order.list');
Route::get('/cancel/order/list', [AllUserController::class, 'CancelOrderList'])->name('cancel.order.list');



});

// topbar cart

Route::get('/mycart', [CartPageController::class, 'MyCart'])->name('mycart');
Route::get('/user/get-cart-product', [CartPageController::class, 'GetCartProduct']);
Route::get('/user/cart-remove/{rowId}', [CartPageController::class, 'RemoveCartProduct']);
Route::get('/cart-increment/{rowId}', [CartPageController::class, 'CartIncrement']);
Route::get('/cart-decrement/{rowId}', [CartPageController::class, 'CartDecrement']);

// Admin Coupons All Routes 

Route::prefix('coupons')->group(function(){

Route::get('/view', [CouponController::class, 'CouponView'])->name('manage-coupon');
Route::post('/store', [CouponController::class, 'CouponStore'])->name('coupon.store');
Route::get('/edit/{id}', [CouponController::class, 'CouponEdit'])->name('coupon.edit');
Route::post('/update/{id}', [CouponController::class, 'CouponUpdate'])->name('coupon.update');

Route::get('/delete/{id}', [CouponController::class, 'CouponDelete'])->name('coupon.delete');


});

// Admin Shipping All Routes 

Route::prefix('shipping')->group(function(){

Route::get('/division/view', [ShippingAreaController::class, 'DivisionView'])->name('manage-division');
Route::post('/division/store', [ShippingAreaController::class, 'DivisionStore'])->name('division.store');
Route::get('/division/edit/{id}', [ShippingAreaController::class, 'DivisionEdit'])->name('division.edit');
Route::post('/division/update/{id}', [ShippingAreaController::class, 'DivisionUpdate'])->name('division.update');
Route::get('/division/delete/{id}', [ShippingAreaController::class, 'DivisionDelete'])->name('division.delete');

// Ship District 
Route::get('/district/view', [ShippingAreaController::class, 'DistrictView'])->name('manage-district');
Route::post('/district/store', [ShippingAreaController::class, 'DistrictStore'])->name('district.store');
Route::get('/district/edit/{id}', [ShippingAreaController::class, 'DistrictEdit'])->name('district.edit');
Route::post('/district/update/{id}', [ShippingAreaController::class, 'DistrictUpdate'])->name('district.update');
Route::get('/district/delete/{id}', [ShippingAreaController::class, 'DistrictDelete'])->name('district.delete');

// Ship State 
Route::get('/state/view', [ShippingAreaController::class, 'StateView'])->name('manage-state');
Route::get('/district-get/ajax/{division_id}', [ShippingAreaController::class, 'DistrictGetAjax']);
Route::post('/state/store', [ShippingAreaController::class, 'StateStore'])->name('state.store');
Route::get('/state/edit/{id}', [ShippingAreaController::class, 'StateEdit'])->name('state.edit');
Route::post('/state/update/{id}', [ShippingAreaController::class, 'StateUpdate'])->name('state.update');
Route::get('/state/delete/{id}', [ShippingAreaController::class, 'StateDelete'])->name('state.delete');


});


// Frontend Coupon Option

Route::post('/coupon-apply', [CartController::class, 'CouponApply']);
Route::get('/coupon-calculation', [CartController::class, 'CouponCalculation']);
Route::get('/coupon-remove', [CartController::class, 'CouponRemove']);

 // Checkout Routes 

Route::get('/checkout', [CartController::class, 'CheckoutCreate'])->name('checkout');
Route::get('/district-get/ajax/{division_id}', [CheckoutController::class, 'DistrictGetAjax']);
Route::get('/state-get/ajax/{district_id}', [CheckoutController::class, 'StateGetAjax']);
Route::post('/checkout/store', [CheckoutController::class, 'CheckoutStore'])->name('checkout.store');


// Admin Dashboard User Order
Route::prefix('orders')->group(function(){

Route::get('/pending/orders', [OrderController::class, 'PendingOrders'])->name('pending-orders');
Route::get('/pending/orders/details/{order_id}', [OrderController::class, 'PendingOrdersDetails'])->name('pending.order.details');
Route::get('/confirmed/orders', [OrderController::class, 'ConfirmedOders'])->name('confirmed-orders');
Route::get('/processing/orders', [OrderController::class, 'ProcessingOders'])->name('processing-orders');
Route::get('/picked/orders', [OrderController::class, 'PickedOders'])->name('picked-orders');
Route::get('/shipped/orders', [OrderController::class, 'ShippedOders'])->name('shipped-orders');
Route::get('/delivered/orders', [OrderController::class, 'DeliveredOders'])->name('delivered-orders');
Route::get('/cancel/orders', [OrderController::class, 'CancelOders'])->name('cancel-orders');
// status change
Route::get('/pending/confirm/{order_id}', [OrderController::class, 'PendingToConfirm'])->name('pending-confirm');
Route::get('/confirm/processing/{order_id}', [OrderController::class, 'ConfirmToProcessing'])->name('confirm-processing');
Route::get('/processing/picked/{order_id}', [OrderController::class, 'ProcessingToPicked'])->name('processing-picked');
Route::get('/picked/shipped/{order_id}', [OrderController::class, 'PickedToShipped'])->name('picked-shipped');
Route::get('/shipped/delivered/{order_id}', [OrderController::class, 'ShippedToDelivered'])->name('shipped-delivered');
Route::get('/delivered/cancel/{order_id}', [OrderController::class, 'DeliveredToCancel'])->name('delivered-cancel');
Route::get('/invoice/download/{order_id}', [OrderController::class, 'AdminInvoiceDownload'])->name('invoice.download');



});


// Admin Dashboard All Reports
Route::prefix('reports')->group(function(){

Route::get('/view', [ReportController::class, 'ReportView'])->name('all-reports');
Route::post('/search/by/date', [ReportController::class, 'ReportByDate'])->name('search.by.date');
Route::post('/search/by/month', [ReportController::class, 'ReportByMonth'])->name('search.by.month');
Route::post('/search/by/year', [ReportController::class, 'ReportByYear'])->name('search.by.year');


});


// Admin Dashboard All Register User
Route::prefix('alluser')->group(function(){

Route::get('/view', [AdminProfileController::class, 'AllUser'])->name('all-users');



});









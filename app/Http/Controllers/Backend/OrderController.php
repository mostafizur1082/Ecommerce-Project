<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use Auth;
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderController extends Controller
{
    public function PendingOrders(){
    $orders = Order::where('status','Pending')->orderBy('id','DESC')->get(); 
    return view('backend.orders.pending_orders',compact('orders'));
    }


// pending orders details
    public function PendingOrdersDetails($order_id){
        $order = Order::with('division','district','state','user')->where('id',$order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
        return view('backend.orders.pending_order_details',compact('order','orderItem'));
    }

    // order status

    public function ConfirmedOders(){
    $orders = Order::where('status','Confirmed')->orderBy('id','DESC')->get(); 
    return view('backend.orders.confirmed_order',compact('orders'));
    }

    public function ProcessingOders(){
    $orders = Order::where('status','Processing')->orderBy('id','DESC')->get(); 
    return view('backend.orders.processing_orders',compact('orders'));
    }


    public function PickedOders(){
    $orders = Order::where('status','Picked')->orderBy('id','DESC')->get(); 
    return view('backend.orders.picked_orders',compact('orders'));
    }

    public function ShippedOders(){
    $orders = Order::where('status','Shipped')->orderBy('id','DESC')->get(); 
    return view('backend.orders.shipped_orders',compact('orders'));
    }


    public function DeliveredOders(){
    $orders = Order::where('status','Delivered')->orderBy('id','DESC')->get(); 
    return view('backend.orders.delivered_orders',compact('orders'));
    }


    public function CancelOders(){
    $orders = Order::where('status','Cancel')->orderBy('id','DESC')->get(); 
    return view('backend.orders.cancel_orders',compact('orders'));
    }


    public function PendingToConfirm($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Confirmed']);
    $notification = array(
            'message' => 'Order Confirmed Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function ConfirmToProcessing($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Processing']);
    $notification = array(
            'message' => 'Order Processing Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function ProcessingToPicked($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Picked']);
    $notification = array(
            'message' => 'Order Picked Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function PickedToShipped($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Shipped']);
    $notification = array(
            'message' => 'Order Shipped Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function ShippedToDelivered($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Delivered']);
    $notification = array(
            'message' => 'Order Delivered Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function DeliveredToCancel($order_id){
    Order::findOrFail($order_id)->update(['status' => 'Cancel']);
    $notification = array(
            'message' => 'Order Canceled Successfully',
            'alert-type' => 'success'
        );

    return redirect()->route('pending-orders')->with($notification);
    
    }

    public function AdminInvoiceDownload($order_id){
        $order = Order::with('division','district','state','user')->where('id',$order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id',$order_id)->orderBy('id','DESC')->get();
        
        $pdf = PDF::loadView('backend.orders.order_invoice', compact('order','orderItem'))->setPaper('a4')->setOptions([
            'tempDir' => public_path(),
            'chroot' => public_path(),
        ]);
     
        return $pdf->download('invoice.pdf');

    }
   

}

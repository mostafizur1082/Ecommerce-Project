<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
Use DateTime;


class ReportController extends Controller
{
    Public function ReportView(){


        return view('backend.report.report_view');
    }

    public function ReportByDate(Request $request){
        
        $date = new DateTime($request->date);
        $dateFormat = $date->format('d F Y');

        $orders = Order::where('order_date',$dateFormat)->latest()->get();
        return view('backend.report.report_show', compact('orders'));
    }

    public function ReportByMonth(Request $request){

        $orders = Order::where('order_month',$request->month)->where('order_year',$request->year)->latest()->get();
        return view('backend.report.report_show', compact('orders'));
    }

    public function ReportByYear(Request $request){

        $orders = Order::where('order_year',$request->year)->latest()->get();
        return view('backend.report.report_show', compact('orders'));
    }

}

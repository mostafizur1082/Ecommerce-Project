<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Carbon\Carbon;
use Image;
use Illuminate\Http\Request;


class SliderController extends Controller
{
    public function SliderView(){
        $sliders = Slider::latest()->get();
        return view('backend.slider.slider_view',compact('sliders'));
    }


     public function SliderStore(Request $request){

        $request->validate([

            'slider_img' => 'required',
        ],[
            'slider_img.required' => 'Please Select One Image',

        ]);

        $image = $request->file('slider_img');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(870,370)->save('upload/slider/'.$name_gen);
        $save_url = 'upload/slider/'.$name_gen;

    Slider::insert([
        'title' => $request->title,
        'description' => $request->description,
        'slider_img' => $save_url,

        ]);

        $notification = array(
            'message' => 'Slider Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    } // end method 

    public function SliderEdit($id){
        $slider = Slider::findOrFail($id);
        return view('backend.slider.slider_edit', compact('slider'));
    }

    public function SliderUpdate(Request $request){

        $request->validate([

            'slider_img' => 'required',
        ],[
            'slider_img.required' => 'Please Select One Image',

        ]);

        $slider_id = $request->id;
        $old_image = $request->old_image;

        if ($request->file('slider_img')) {

        unlink($old_image);

        $image = $request->file('slider_img');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(870,370)->save('upload/slider/'.$name_gen);
        $save_url = 'upload/slider/'.$name_gen;

        Slider::findOrFail($slider_id)->update([
        'title' => $request->title,
        'description' => $request->description,
        'slider_img' => $save_url,

        ]);

        $notification = array(
            'message' => 'Slider Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('manage-slider')->with($notification);
    }else{
        Slider::findOrFail($slider_id)->update([
        'title' => $request->title,
        'description' => $request->description,

        ]);


        $notification = array(
            'message' => 'Slider Updated without image Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('manage-slider')->with($notification);
    }

    } // end method 

    public function SliderDelete($id){
        $slider = Slider::findOrFail($id);
        $image = $slider->slider_img;
        unlink($image);

        Slider::findOrFail($id)->delete();

        $notification = array(
            'message' => 'slider Deleted Successfully',
            'aleart-type' => 'info' 
        );
        return redirect()->back()->with($notification);
    }


    // Slider status inactive
     public function SliderInactive($id){
        Slider::findOrFail($id)->update(['status' => 0]);
        $notification = array(
            'message' => 'Slider Inactive',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
     } //end mathod


// Slider status active
  public function SliderActive($id){
    Slider::findOrFail($id)->update(['status' => 1]);
        $notification = array(
            'message' => 'Slider Active',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

     }


}

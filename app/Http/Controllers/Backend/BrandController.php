<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Http\Request;
use Image;

class BrandController extends Controller
{
    public function brandView(){
        $brands = Brand::latest()->get();
        return view('backend.brand.brand_view', compact('brands'));
    }

    public function brandStore(Request $request){
        $request->validate([
            'brand_name_en' => 'required',
            'brand_name_bn' => 'required',
            'brand_image' => 'required',
        ],[
            'brand_name_en.required' => 'Input Brand Name English',
            'brand_name_bn.required' => 'Input Brand Name Bangla',
        ]);

        $image = $request->file('brand_image');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(166,110)->save('upload/brand/'.$name_gen);
        $save_url = 'upload/brand/'.$name_gen;

        Brand::insert([
            'brand_name_en' => $request->brand_name_en,
            'brand_name_bn' => $request->brand_name_bn,
            'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
            'brand_slug_bn' => strtolower(str_replace(' ', '-',$request->brand_name_bn)),
            'brand_image' => $save_url,
        ]);

        $notification = array(
            'message' => 'Brand Inserted Successfully',
            'aleart-type' => 'success' 
        );
        return redirect()->back()->with($notification);
        
    }

    public function brandEdit($id){
        $brand = Brand::findOrFail($id);
        return view('backend.brand.brand_edit', compact('brand'));
    }

    public function brandUpdate(Request $request){
        $request->validate([
            'brand_name_en' => 'required',
            'brand_name_bn' => 'required',
        ],[
            'brand_name_en.required' => 'Input Brand Name English',
            'brand_name_bn.required' => 'Input Brand Name Bangla',
        ]);


        $brand_id = $request->id;
        $old_image = $request->old_image;

        if ($request->file('brand_image')) {

        unlink($old_image);
        $image = $request->file('brand_image');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(166,110)->save('upload/brand/'.$name_gen);
        $save_url = 'upload/brand/'.$name_gen;

        Brand::findOrFail($brand_id)->update([
            'brand_name_en' => $request->brand_name_en,
            'brand_name_bn' => $request->brand_name_bn,
            'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
            'brand_slug_bn' => strtolower(str_replace(' ', '-',$request->brand_name_bn)),
            'brand_image' => $save_url,
        ]);

        $notification = array(
            'message' => 'Brand Updated Successfully',
            'aleart-type' => 'info' 
        );
        return redirect()->route('all.brand')->with($notification);
        }else{
            Brand::findOrFail($brand_id)->update([
            'brand_name_en' => $request->brand_name_en,
            'brand_name_bn' => $request->brand_name_bn,
            'brand_slug_en' => strtolower(str_replace(' ', '-',$request->brand_name_en)),
            'brand_slug_bn' => strtolower(str_replace(' ', '-',$request->brand_name_bn)),
        ]);

        $notification = array(
            'message' => 'Brand Updated Successfully',
            'aleart-type' => 'info' 
        );
        return redirect()->route('all.brand')->with($notification);

        }
    }

    public function brandDelete($id){
        $brand = Brand::findOrFail($id);
        $image = $brand->brand_image;
        unlink($image);

        Brand::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Brand Deleted Successfully',
            'aleart-type' => 'info' 
        );
        return redirect()->back()->with($notification);
    }
}

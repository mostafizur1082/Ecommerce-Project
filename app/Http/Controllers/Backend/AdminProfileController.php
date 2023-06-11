<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminProfileController extends Controller
{
    public function adminprofile(){
        $admindata = Admin::find(1);
        return view('admin.admin_profile_view', compact('admindata'));
    }

    public function adminprofileedit(){
       $editdata = Admin::find(1);
        return view('admin.admin_profile_edit', compact('editdata')); 
    }

    public function adminprofilestore(Request $request){
        $data = Admin::find(1);
        $data->name = $request->name;
        $data->email = $request->email;

        if ($request->file('profile_photo_path')){
            $file = $request->file('profile_photo_path');
            @unlink(public_path('upload/admin_images/'.$data->profile_photo_path));
            $fileName = date('YmdHi').$file->getClientOriginalName();
            $file->move(public_path('upload/admin_images'),$fileName); 
            $data['profile_photo_path'] = $fileName;
        }
        $data->save();

        $notification = array(
            'message' => 'Admin Profile Update Successfully',
            'aleart-type' => 'success' 
        );
        return redirect()->route('admin.profile')->with($notification);
    }

    public function adminchangepassword(){
        return view('admin.admin_change_password');
    }

    public function adminupdatepassword(Request $request){
        $validatedata = $request->validate([
            'old_password' => 'required',
            'password'=> 'required|confirmed',
        ]);

        $hashedpassword = Admin::find(1)->password;
        if(Hash::check($request->old_password,$hashedpassword)){
            $admin = Admin::find(1);
            $admin->password = Hash::make($request->password);
            $admin->save();
            Auth::logout();
            return redirect()->route('admin.logout');
        }else{
            return redirect()->back();
        }
    }
}

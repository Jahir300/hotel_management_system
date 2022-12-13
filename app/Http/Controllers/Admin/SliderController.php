<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Slider;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = Slider::all();
        return view('admin.slider.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.slider.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [

            'name' => 'required|string',
            'image' => 'required',
        ]);

        $image = $request->file('image');
        if (isset($image)) {
            $currendate = Carbon::now()->toDateString();
            $imagename = $currendate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();

            if (!file_exists('uploads/slider')) {
                mkdir('uploads/slider', 0777, true);
            }
            $image->move('uploads/slider', $imagename);
        } else {
            $imagename = 'default.png';
        }

        $category = new Slider();
        $category->name = $request->name;
        $category->description = $request->description;
        $category->image = $imagename;
        $category->save();
        Toastr::success('success', 'Slider Added Successfully');
        return redirect()->route('admin.slider.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Slider $slider)
    {
        if($slider->status == 1){
            $slider->status = 0;
            $slider->save();
            Toastr::success('Slider Inactivated');
            return redirect()->back();
        }else{
            $slider->status = 1;
            $slider->save();
            Toastr::success('Slider Activated');
            return redirect()->back();
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        return view('admin.slider.edit', compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        $this->validate($request, [

            'name' => 'required|string'
        ]);

        $image = $request->file('image');
        $slug = str_slug($request->name);
        if (isset($image)) {
            $currendate = Carbon::now()->toDateString();
            $imagename = $slug . '-' . $currendate . '-' . uniqid() . '.' . $image->getClientOriginalExtension();
            
            if (!file_exists('uploads/slider')) {
                mkdir('uploads/slider', 0777, true);
            }
            if (file_exists('uploads/slider/' . $slider->image)) {
                unlink('uploads/slider/' . $slider->image);
            }
            $image->move('uploads/slider', $imagename);
        } else {
            $imagename = $slider->image;
        }

        $slider->name = $request->name;
        $slider->description = $request->description;
        $slider->image = $imagename;
        $slider->save();

        Toastr::success('success', 'Slider Updated Successfully');
        return redirect()->route('admin.slider.index');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        if (file_exists('uploads/slider/' . $slider->image)) {
            unlink('uploads/slider/' . $slider->image);
        }
        $slider->delete();
        Toastr::success('success', 'Category Deleted Successfully');
        return redirect()->back();
    }
}

<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RecordRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    /*public function authorize()
    {
        return false;
    }*/

    public function messages()
    {
        return [
            'measured_at.required' => 'A timestamp is required',
            'measured_at.numeric' => 'A timestamp must be numeric',
            'value.required'  => 'value is required',
            'value.numeric'  => 'value must be numeric',
            'sensor_id.required'  => 'sensor_id is required',
            'sensor_id.min'  => 'sensor_id is under min value',
            'sensor_id.max'  => 'sensor_id is over max value',
            'isActive.required'  => 'isActive is required',
            'isActive.boolean'  => 'isActive must be boolean'
        ];
    }

    public function all($keys = null)
    {
        $data = parent::all($keys);
        return $data;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            'measured_at' => 'required|numeric',
            'value' => 'required|numeric',
            'sensor_id' => 'required|min:1|max:999',
            'isActive' => 'required|boolean'
        ];

        switch ($this->getMethod())
        {
            case 'POST':
                return $rules;
            default:
                return null;
        }
    }
}

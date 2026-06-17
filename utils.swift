//
//  utils.swift
//  eschy
//
//  Created by Abhinav Mara on 6/17/26.
//

import Foundation
import Supabase

func printResponse(response: Optional<PostgrestResponse<Any>>) {
    if let data = response?.data {
        if let jsonString = String(data: data, encoding: .utf8) {
            print(jsonString)
        } else {
            print("Unable to convert data to a UTF-8 string.")
        }
    }
}



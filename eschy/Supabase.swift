//
//  Supabase.swift
//  eschy
//
//  Created by Abhinav Mara on 5/18/26.
//

import Foundation
import Supabase
import Auth

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://qlqhgjqtcwnxpjlwmxti.supabase.co")!,
  supabaseKey: "sb_publishable_UIu9vRjLN16OaNR-pFJ4rg_l02_d7S6",
  options: SupabaseClientOptions(auth: SupabaseClientOptions.AuthOptions(
    redirectToURL: URL(string: "com.eschy.auth://callback")
  ))
)

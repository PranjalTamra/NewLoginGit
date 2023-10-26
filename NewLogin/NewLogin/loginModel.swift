//
//  loginModel.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import Foundation
struct LoginModel : Codable {
    let code : String?
    let data : User?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        data = try values.decodeIfPresent(User.self, forKey: .data)
    }

}

struct User : Codable {
    let id : Int?
    let first_name : String?
    let middle_name : String?
    let last_name : String?
    let email : String?
    let email_verified_at : String?
    let email_verified_code : String?
    let profile : String?
    let profile_url : String?
    let mobile : String?
    let mobile_verified : String?
    let role : String?
    let address_line_1 : String?
    let address_line_2 : String?
    let address_lat : String?
    let address_long : String?
    let region_id : String?
    let region_name : String?
    let city_id : String?
    let city_name : String?
    let state_id : String?
    let state_name : String?
    let country_id : String?
    let country_name : String?
    let zipcode : String?
    let verify_otp : String?
    let verify_status : String?
    let verify_at : String?
    let created_by : String?
    let updated_by : Int?
    let deleted_by : String?
    let created_at : String?
    let updated_at : String?
    let deleted_at : String?
    let delete_flag : String?
    let login_otp : Int?
    let login_otp_status : String?
    let account_status : String?
    let suspend_reason : String?
    let account_status_by : String?
    let account_status_at : String?
    let hospital_id : String?
    let hospital_detail_id : String?
    let notification_text : String?
    let notification_email_old : String?
    let referral_code : String?
    let referral_by : String?
    let referral_type : String?
    let last_login : String?
    let ip : String?
    let welcome_flag : String?
    let netspend_acc_no : String?
    let netspend_acc_status : String?
    let payment_gateway : String?
    let netspend_enroll_datetime : String?
    let object_id : String?
    let business_type_id : String?
    let aws_profile_url : String?
    let organization_id : String?
    let notification_status : String?
    let notification_email : String?
    let notification_mobile : String?
    let category : String?
    let is_company_primary_user : Int?
    let google2fa_enable : Int?
    let google2fa_secret : String?
    let access_token : String?
    let token_type : String?
    let expires_at : String?
   

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case first_name = "first_name"
        case middle_name = "middle_name"
        case last_name = "last_name"
        case email = "email"
        case email_verified_at = "email_verified_at"
        case email_verified_code = "email_verified_code"
        case profile = "profile"
        case profile_url = "profile_url"
        case mobile = "mobile"
        case mobile_verified = "mobile_verified"
        case role = "role"
        case address_line_1 = "address_line_1"
        case address_line_2 = "address_line_2"
        case address_lat = "address_lat"
        case address_long = "address_long"
        case region_id = "region_id"
        case region_name = "region_name"
        case city_id = "city_id"
        case city_name = "city_name"
        case state_id = "state_id"
        case state_name = "state_name"
        case country_id = "country_id"
        case country_name = "country_name"
        case zipcode = "zipcode"
        case verify_otp = "verify_otp"
        case verify_status = "verify_status"
        case verify_at = "verify_at"
        case created_by = "created_by"
        case updated_by = "updated_by"
        case deleted_by = "deleted_by"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case delete_flag = "delete_flag"
        case login_otp = "login_otp"
        case login_otp_status = "login_otp_status"
        case account_status = "account_status"
        case suspend_reason = "suspend_reason"
        case account_status_by = "account_status_by"
        case account_status_at = "account_status_at"
        case hospital_id = "hospital_id"
        case hospital_detail_id = "hospital_detail_id"
        case notification_text = "notification_text"
        case notification_email_old = "notification_email_old"
        case referral_code = "referral_code"
        case referral_by = "referral_by"
        case referral_type = "referral_type"
        case last_login = "last_login"
        case ip = "ip"
        case welcome_flag = "welcome_flag"
        case netspend_acc_no = "netspend_acc_no"
        case netspend_acc_status = "netspend_acc_status"
        case payment_gateway = "payment_gateway"
        case netspend_enroll_datetime = "netspend_enroll_datetime"
        case object_id = "object_id"
        case business_type_id = "business_type_id"
        case aws_profile_url = "aws_profile_url"
        case organization_id = "organization_id"
        case notification_status = "notification_status"
        case notification_email = "notification_email"
        case notification_mobile = "notification_mobile"
        case category = "category"
        case is_company_primary_user = "is_company_primary_user"
        case google2fa_enable = "google2fa_enable"
        case google2fa_secret = "google2fa_secret"
        case access_token = "access_token"
        case token_type = "token_type"
        case expires_at = "expires_at"
       
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        middle_name = try values.decodeIfPresent(String.self, forKey: .middle_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        email_verified_at = try values.decodeIfPresent(String.self, forKey: .email_verified_at)
        email_verified_code = try values.decodeIfPresent(String.self, forKey: .email_verified_code)
        profile = try values.decodeIfPresent(String.self, forKey: .profile)
        profile_url = try values.decodeIfPresent(String.self, forKey: .profile_url)
        mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
        mobile_verified = try values.decodeIfPresent(String.self, forKey: .mobile_verified)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        address_line_1 = try values.decodeIfPresent(String.self, forKey: .address_line_1)
        address_line_2 = try values.decodeIfPresent(String.self, forKey: .address_line_2)
        address_lat = try values.decodeIfPresent(String.self, forKey: .address_lat)
        address_long = try values.decodeIfPresent(String.self, forKey: .address_long)
        region_id = try values.decodeIfPresent(String.self, forKey: .region_id)
        region_name = try values.decodeIfPresent(String.self, forKey: .region_name)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        country_id = try values.decodeIfPresent(String.self, forKey: .country_id)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        verify_otp = try values.decodeIfPresent(String.self, forKey: .verify_otp)
        verify_status = try values.decodeIfPresent(String.self, forKey: .verify_status)
        verify_at = try values.decodeIfPresent(String.self, forKey: .verify_at)
        created_by = try values.decodeIfPresent(String.self, forKey: .created_by)
        updated_by = try values.decodeIfPresent(Int.self, forKey: .updated_by)
        deleted_by = try values.decodeIfPresent(String.self, forKey: .deleted_by)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
        delete_flag = try values.decodeIfPresent(String.self, forKey: .delete_flag)
        login_otp = try values.decodeIfPresent(Int.self, forKey: .login_otp)
        login_otp_status = try values.decodeIfPresent(String.self, forKey: .login_otp_status)
        account_status = try values.decodeIfPresent(String.self, forKey: .account_status)
        suspend_reason = try values.decodeIfPresent(String.self, forKey: .suspend_reason)
        account_status_by = try values.decodeIfPresent(String.self, forKey: .account_status_by)
        account_status_at = try values.decodeIfPresent(String.self, forKey: .account_status_at)
        hospital_id = try values.decodeIfPresent(String.self, forKey: .hospital_id)
        hospital_detail_id = try values.decodeIfPresent(String.self, forKey: .hospital_detail_id)
        notification_text = try values.decodeIfPresent(String.self, forKey: .notification_text)
        notification_email_old = try values.decodeIfPresent(String.self, forKey: .notification_email_old)
        referral_code = try values.decodeIfPresent(String.self, forKey: .referral_code)
        referral_by = try values.decodeIfPresent(String.self, forKey: .referral_by)
        referral_type = try values.decodeIfPresent(String.self, forKey: .referral_type)
        last_login = try values.decodeIfPresent(String.self, forKey: .last_login)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        welcome_flag = try values.decodeIfPresent(String.self, forKey: .welcome_flag)
        netspend_acc_no = try values.decodeIfPresent(String.self, forKey: .netspend_acc_no)
        netspend_acc_status = try values.decodeIfPresent(String.self, forKey: .netspend_acc_status)
        payment_gateway = try values.decodeIfPresent(String.self, forKey: .payment_gateway)
        netspend_enroll_datetime = try values.decodeIfPresent(String.self, forKey: .netspend_enroll_datetime)
        object_id = try values.decodeIfPresent(String.self, forKey: .object_id)
        business_type_id = try values.decodeIfPresent(String.self, forKey: .business_type_id)
        aws_profile_url = try values.decodeIfPresent(String.self, forKey: .aws_profile_url)
        organization_id = try values.decodeIfPresent(String.self, forKey: .organization_id)
        notification_status = try values.decodeIfPresent(String.self, forKey: .notification_status)
        notification_email = try values.decodeIfPresent(String.self, forKey: .notification_email)
        notification_mobile = try values.decodeIfPresent(String.self, forKey: .notification_mobile)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        is_company_primary_user = try values.decodeIfPresent(Int.self, forKey: .is_company_primary_user)
        google2fa_enable = try values.decodeIfPresent(Int.self, forKey: .google2fa_enable)
        google2fa_secret = try values.decodeIfPresent(String.self, forKey: .google2fa_secret)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
        token_type = try values.decodeIfPresent(String.self, forKey: .token_type)
        expires_at = try values.decodeIfPresent(String.self, forKey: .expires_at)
       
    }

}


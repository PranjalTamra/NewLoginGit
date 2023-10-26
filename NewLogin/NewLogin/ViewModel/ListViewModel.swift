//
//  ListViewModel.swift
//  NewLogin
//
//  Created by Pranjal Tmarakar on 26/10/23.
//

import Foundation

class ListViewModel{
    
    var vc : ListVC?
    var categoryList: ListModel?
    var dataArray : ListModel?
    
    func listApi(complitionHanlder : @escaping() -> Void  ){
    
        let pageVal = 1
        let urlMetod =  "?" + "page=" + "\(pageNo)"
        
        Api_Http_Class.shareinstance.APICall(methodName: urlMetod, params: nil , method: .get, vc: vc!  ) { requestResult in
           
            switch requestResult {
            case .success(let data, let any):
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ListModel.self, from: data)
                        print("10", response)
                        if response != nil   {
                            
                            DispatchQueue.main.async {
                                
                                self.dataArray = response
                                complitionHanlder()
                            }
                            
                            
                            DispatchQueue.main.async {
                            
                                
                                if pageNo == response.total_pages {
                                    self.dataArray = response

                                    complitionHanlder()

                                   // self?.arrUser = responce.data!
                                    return
                                }else{
                                    self.dataArray = response
                                    pageNo += 1
                                    complitionHanlder()                            }
                                
                        
                            }
                            
                        }else {
                            DispatchQueue.main.async {
                              //  self.categoryVC?.hideLoder()
                               self.vc?.singleActionAlert(withTitle: "Alert", withMessage: "", withButtonTitle: "OK")
                            }
                            
                        }
                        
                    }catch {
                        print(error)
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            self.vc?.singleActionAlert(withTitle: "Alert", withMessage: error.localizedDescription , withButtonTitle: "OK")
                        }
                    }
                }
            case .failer(let error):
                print("error\(error)and \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    
}

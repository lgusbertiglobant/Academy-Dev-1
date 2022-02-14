@isTest
global class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        parkService.byCountryResponse response_x = new parkService.byCountryResponse();
        response_x.return_x = new List<String>{'Parque Nacional de Los Glaciares', 'Perito Moreno', 'El Leoncito'};
        response.put('response_x', response_x);      
   }
}
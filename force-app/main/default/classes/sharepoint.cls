public class sharepoint {
  public static String getAccessToken(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://accounts.accesscontrol.windows.net/abb35cb3-81e2-44a3-912c-0266da5585fa/tokens/oAuth/2');
        req.setMethod('POST');
        String Requestbody ='grant_type=client_credentials';
        Requestbody +='&client_id=270ba557-1d1c-450d-8847-697ddd3cd517@abb35cb3-81e2-44a3-912c-0266da5585fa';
        Requestbody +='&client_secret=6JN0eyFCe81Tbb752DVksXYKip87xbanb3dfTvOUgtg=';
        Requestbody +='&resource=00000003-0000-0ff1-ce00-000000000000/cloudsynapps.sharepoint.com@abb35cb3-81e2-44a3-912c-0266da5585fa';
        req.setBody(Requestbody);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseBody = res.getBody();
        System.debug('responseBody'+responseBody);
        System.debug('responseBody'+res.getStatus());
        Map <String, Object> resultObject = (Map <String, Object>)JSON.deserializeUntyped(responseBody);
        String accessToken = (String)resultObject.get('access_token');
        return accessToken;
       //
    }
    public static void createFolderSharepoint(){
       String folderurl = 'https://cloudsynapps.sharepoint.com/sites/Sharepoint/_api/web/Folders/AddUsingPath(decodedurl="Shared%20Documents/Folder%25")';
           // String Fileurl  = 'https://cloudsynapps.sharepoint.com/sites/Sharepoint/_api/web/getfolderbyserverrelativepath(decodedurl='Shared%20Documents')/files/AddUsingPath(overwrite=true,decodedurl='new.docx')';
        System.debug('url'+folderurl);
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setEndpoint(folderurl);
        System.debug('accessToken>>>>>>>>>>>>>>>>>>>'+getAccessToken());
        req.setHeader('Authorization', 'Bearer' + getAccessToken());
        req.setHeader('accept', 'application/json;odata=verbose');
       // req.setHeader('Content-type', 'application/json;odata=verbose');
       // req.setHeader('Content-Length', '1');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseBody = res.getBody();
        System.debug('responseBody'+responseBody);
       // System.debug('responseBody'+res.getStatus());
    }}
package api.data;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node; //node를 사용하기위해 추가
import org.w3c.dom.NodeList; //nodelist를 사용하기위해 추가
import org.xml.sax.SAXException;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;

public class Abandon {
	
	public static String xmlDownload() throws IOException {/*정적 메소드정의?-> 정적 메소드를 사용하면 JSP에서 객체의 선언 없이 바로 클래스 이름 뒤에 붙여서 활용가능*/
        StringBuilder urlBuilder = new StringBuilder("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=E91pTD4K%2BO%2Fhny3wnTy4%2BCrjpQc9JCeBWcoYHGTzSFoGyki1XMtTmw2lWZjprtDMF7dm9eHVLvaB1sXiTeTuaQ%3D%3D"); /*Service Key*/
        
        //&upkind=417000&pageNo=1&numOfRows=10
//        String bgndey = bgnde;
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String enddey= df.format(cal.getTime());
        System.out.println("bgndey: " + enddey);
        cal.add(Calendar.DATE, -7);
        String bgndey = df.format(cal.getTime());
        System.out.println("after: " + bgndey);
        System.out.print(urlBuilder);
        urlBuilder.append("&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode(bgndey, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode(enddey, "UTF-8"));/*시도 이름 (서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)*/
        urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("60", "UTF-8"));
      
        
        URL url = new URL(urlBuilder.toString()); /*위의 urlBuilder를 하나로 합쳐서 url 이라는 변수에 저장*/
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET"); 
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode()); 
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
           
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"utf-8"));
        }
        StringBuilder sb = new StringBuilder();
        String line; 
        while ((line = rd.readLine()) != null) { 
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		return sb.toString();
    }
	
	public ArrayList<AbandonDto> getAbandonList() throws IOException, ParserConfigurationException, SAXException{
		ArrayList<AbandonDto> list = new ArrayList<AbandonDto>();
		String xml = Abandon.xmlDownload();
		/* xml 파싱 -> List<item>*/
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		
		Document doc = builder.parse(new ByteArrayInputStream(xml.getBytes("utf-8")));


		
		NodeList nodeList = doc.getElementsByTagName("item");/*xml태그이름 중  item 부분을 전부 긁어모음*/
		for(int i=0; i<nodeList.getLength(); i++) {
			AbandonDto dto = new AbandonDto();
			Node node = nodeList.item(i);
			//태그안에 있는 요소를 가져오기위해 Element를 형변환 하여 다시 담아줌
			Element e = (Element)node;
			dto.setAge(e.getElementsByTagName("age").item(0).getTextContent());
			dto.setCareaddr(e.getElementsByTagName("careAddr").item(0).getTextContent());
			dto.setCareNm(e.getElementsByTagName("careNm").item(0).getTextContent());
			dto.setOfficetel(e.getElementsByTagName("officetel").item(0).getTextContent());
			dto.setColorcd(e.getElementsByTagName("colorCd").item(0).getTextContent());
			dto.setDesertionNo(e.getElementsByTagName("desertionNo").item(0).getTextContent());
			dto.setKindcd(e.getElementsByTagName("kindCd").item(0).getTextContent());
			dto.setNeuteryn(e.getElementsByTagName("neuterYn").item(0).getTextContent());
			dto.setSexCd(e.getElementsByTagName("sexCd").item(0).getTextContent());
			dto.setPopfile(e.getElementsByTagName("popfile").item(0).getTextContent());
			dto.setSpecialmark(e.getElementsByTagName("specialMark").item(0).getTextContent());
			dto.setNoticeSdt(e.getElementsByTagName("noticeSdt").item(0).getTextContent());
			list.add(dto);
		}
		
		System.out.println(doc);
		
		
		return list;
	}
}


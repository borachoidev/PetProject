package api.data;

import java.util.HashMap;
import java.util.LinkedList;

public class AbandonDto {
	private String age;
	private String careaddr;
	private String careNm;
	private String officetel;
	private String colorcd;
	private String desertionNo;
	private String kindcd;
	private String neuteryn;
	private String sexCd;
	private String popfile;
	private String specialmark;
	private String noticeSdt;
	private LinkedList<HashMap<String, Object>> resultList;
	private int total;          //모든 로우의 수 
	private int currentTotal;   //현재 페이지가 보여주는 로우의 수 
	private int totalPage;      //총페이징 수
	private int pageNum;        //현재 페이지 번호
	private int pageSize;       //페이징의 범위
	private String str;         //검색 문자열
	private String pageNavi;    //페이지 네비게이션을 html형태의 문자열로 관리 
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getCareaddr() {
		return careaddr;
	}
	public void setCareaddr(String careaddr) {
		this.careaddr = careaddr;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getOfficetel() {
		return officetel;
	}
	public void setOfficetel(String officetel) {
		this.officetel = officetel;
	}
	public String getColorcd() {
		return colorcd;
	}
	public void setColorcd(String colorcd) {
		this.colorcd = colorcd;
	}
	public String getDesertionNo() {
		return desertionNo;
	}
	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}
	public String getKindcd() {
		return kindcd;
	}
	public void setKindcd(String kindcd) {
		this.kindcd = kindcd;
	}
	public String getNeuteryn() {
		return neuteryn;
	}
	public void setNeuteryn(String neuteryn) {
		this.neuteryn = neuteryn;
	}
	public String getSexCd() {
		return sexCd;
	}
	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}
	public String getPopfile() {
		return popfile;
	}
	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}
	public String getSpecialmark() {
		return specialmark;
	}
	public void setSpecialmark(String specialmark) {
		this.specialmark = specialmark;
	}
	public String getNoticeSdt() {
		return noticeSdt;
	}
	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}
	
public AbandonDto(){}
	
	/**
	 * 총 페이지 수
	 * 
	 * @return
	 */
    public int getTotalPage() {
		return totalPage;
	}

    /**
     * 총 페이지 수
     * 
     * @param totalPage
     */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

    /**
     * 현재 페이지번호
     * @return
     */
	public int getPageNum() {
		return pageNum;
	}
    
	/**
	 * 현재 페이지 번호
	 * 
	 * @param pageNum
	 */
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	/**
	 * 현재 페이지에 보여주고 있는 로우수
	 * 
	 * @return 
	 */
	public int getCurrentTotal() {
		return currentTotal;
	}
    
	/**
	 * 현재 페이지에 보여주고 있는 로우수
	 * 
	 * @param currentTotal
	 */
	public void setCurrentTotal(int currentTotal) {
		this.currentTotal = currentTotal;
	}
    
	/**
	 * 문자열로 된 페이징
	 * 
	 * @param pageNavi
	 */
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}

	/**
	 * 문자열로 된 페이징
	 * 
	 * @return
	 */
	public String getPageNavi() {
		return pageNavi;
	}

	/**
	 * 문자열로 된 페이지네비이션을 생성함
	 * ex> 매개변수가 5일경우 << < 1 | 2 | 3 | 4 | 5> >>
	 * 
	 * @param pageSize 페이지네비게이션 범위
	 */
	public void setPageNavi(int paramPageSize) {
		this.pageSize = paramPageSize;
		totalPage = 1;
		if(total > 5) totalPage = (int) Math.ceil(total/5.0);
		StringBuffer buf  = new StringBuffer("\r\n");
		
		//시작페이지 번호
		int startPage = ((pageNum % pageSize) > 0) ? ((int)(pageNum/pageSize)*pageSize + 1) : (((int)(pageNum/pageSize)-1)*pageSize + 1);    
		//마지막페이지 번호
		int endPage   = startPage + (pageSize - 1);   

		//첫번째 페이지 이동
		if(pageNum > 1){ 
			buf.append("<a href=\"javascript:getPoiData(1,5,1,'str');\"><<<a/>");
		}else{
			buf.append("<<");
		}
		buf.append(" | ");
		

		//이전 숫자네비게이션 호출
		if( startPage <= pageSize){
			buf.append("<");
		}else{
			buf.append("<a href=\"javascript:getPoiData("+((startPage - 1) * 5 - 4)+","+((startPage - 1) * 5)+","+(startPage - 1)+",'str');\"><<a/>");
		}
		buf.append(" | ");
		
		
		
		//숫자형태 네비게이션
		for(int i = startPage; i <= endPage; i++ ){
			if ( i > totalPage) break; //총페이지수를 벗어나면 루프를 정지함
			//System.out.println("pageNum : " + pageNum);
			if(i != getPageNum()){
				buf.append("<a href=\"javascript:getPoiData("+(i * 5 - 4)+","+(i * 5)+","+i+",'str');\">"+i+"<a/>");
			}else{//현재 페이지 번호는 색을 변경
				buf.append("<a href=\"javascript:getPoiData("+(i * 5 - 4)+","+(i * 5)+","+i+",'str');\"><font color='red'>"+i+"</font><a/>");
			}
			//if(i < totalPage) buf.append(" | ");
			buf.append(" | ");
		}
		//다음번 숫자네비게이션 호출
		if( endPage >= totalPage){
			buf.append(">");
		}else{
			buf.append("<a href=\"javascript:getPoiData("+((endPage + 1) * 5 - 4)+","+((endPage+1) * 5)+","+(endPage+1)+",'str');\">><a/>");
		}
		buf.append(" | ");
		
		//마지막 페이지 이동
		//System.out.println("현재페이지 번호는 : " + pageNum);
		//System.out.println("마지막페이지 번호는 : " + totalPage);
		
		if(pageNum < totalPage){ 
			buf.append("<a href=\"javascript:getPoiData("+ (totalPage * 5 - 4) +","+ (totalPage * 5) +","+totalPage+",'str');\">>><a/>");
		}else{
			buf.append(">>");
		}
		this.pageNavi = buf.toString();
	}
	   
	/**
	 * 검색 문자열
	 * 
	 * @return
	 */
	public String getStr() {
		return str;
	}
    
	/**
	 * 검색 문자열
	 * 
	 * @param str
	 */
	public void setStr(String str) {
		this.str = str;
	}

	/**
	 * 파싱된 데이터의 수를 반환
	 * 
	 * @return
	 */
	public int getTotal() {
		return total;
	}
	
	/**
	 * 파싱된 데이터의 수를 반환
	 * 
	 * @param total
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	
	/**
	 * HashMap 형태의 LinkedList 객체 반환
	 * 
	 * @return
	 */
	public LinkedList<HashMap<String, Object>> getResultList() {
		return resultList;
	}

	/**
	 * HashMap 형태의 LinkedList 객체 저장
	 * 
	 * @param resultList
	 */
	public void setResultList(LinkedList<HashMap<String, Object>> resultList) {
		this.resultList = resultList;
	}
	
	

}



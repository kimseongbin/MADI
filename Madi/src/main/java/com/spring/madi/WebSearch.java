package com.spring.madi;

import java.util.ArrayList;
import java.util.List;

import kr.co.shineware.nlp.komoran.core.analyzer.Komoran;
import kr.co.shineware.util.common.model.Pair;

public class WebSearch {

	// KOMORAN TEST
	public void komoranTest(String text) {
		Komoran komoran = new Komoran("C:\\sw\\komoran\\models");
		List<List<Pair<String, String>>> result = komoran.analyze(text);
		for (List<Pair<String, String>> eojeolResult : result) {
			for (Pair<String, String> wordMorph : eojeolResult) {
				// System.out.println(wordMorph);

				log(wordMorph.getFirst());
				log(wordMorph.getSecond());

			}
		}
	}

	// 형태소 분석 메소드
	// 특정 텍스트 데이터에서 의미를 갖는 최소한의 형태소만 추출하는 메소드
	// 예를 들어, 검색어로 "녹두로 할 수 있는 서양요리"가 입력되면
	// 녹두, 서양, 요리 가 추출된다
	public List<String> getNounFromText(String text) {
		// 텍스트 분석 komran 객체 생성
		Komoran komoran = new Komoran("C:\\sw\\komoran\\models");
		// 추출한 명사 목록을 담을 리스트 객체 생성
		List<String> nounList = new ArrayList<String>();
		// 텍스 분석 결과를 저장할 Pair Set 리스트 객체 생성
		List<List<Pair<String, String>>> result = komoran.analyze(text);
		// 분석 결과 중 고유 의미를 갖는 명사만 추출하여 nounList에 저장
		for (List<Pair<String, String>> eojeolResult : result) {
			for (Pair<String, String> wordMorph : eojeolResult) {
				if(wordMorph.getSecond().equals("NNG")) {
					String log = "검색어 '"+text+"' 로 부터 다음의 명사를 추출했습니다. NNG : " + wordMorph.getFirst();
					log(log);
					nounList.add(wordMorph.getFirst());
				}
			}
		}
		String log2 = "검색어 '" + text + "'로 부터 총 " + nounList.size() + "개의 명사를 추출했습니다.";
		log(log2);
		
		return nounList;
	}

	public static void main(String[] args) {
		WebSearch webSearch = new WebSearch();
		SearchEngine searchEngine = new SearchEngine();
		String text = "녹두로 할 수 있는 서양 요리";
		List<String> nounList = webSearch.getNounFromText(text);
		String sql = searchEngine.getSearchQueryByNoun(nounList);
		log(sql);
	}
	
	private static void log(String log) {
		System.out.println("SYSTEM  :  " + log);
	}
	
}

package com.spring.madi;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class RecipeDAOService implements RecipeDAO {
	
	// DB와 Mybatis 연결을 위한 연결 객체
		@Autowired
		private SqlSession sqlSession;
		
		public RecipeVO getRecipeById(RecipeVO recipeVO) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			RecipeVO vo = new RecipeVO();
			vo = recipeMapper.getRecipeById(recipeVO);
			
			return vo;
		}
		
		public ArrayList<RecipeIrdntVO> getRecipeIrdntById(RecipeVO recipeVO){
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeIrdntVO> recipeIrdnt = new ArrayList<RecipeIrdntVO>();
			recipeIrdnt = recipeMapper.getRecipeIrdntById(recipeVO);
			
			return recipeIrdnt;
		}
		
		public ArrayList<RecipeProcessVO> getRecipeProcessById(RecipeVO recipeVO) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeProcessVO> recipeProcess = new ArrayList<RecipeProcessVO>();
			recipeProcess = recipeMapper.getRecipeProcessById(recipeVO);
			
			return recipeProcess;
		}
		
		
		@Override
		public ArrayList<RecipeVO> postList() {
			// 게시물 목록
			ArrayList<RecipeVO> postList = new ArrayList<RecipeVO>();
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			postList = recipeMapper.postList();
		
			return postList;
		}
		 
		@Override
		public void insertRecipe(RecipeVO recipeVO) {
			
			// 게시물 등록
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			recipeMapper.insertRecipe(recipeVO);
		}
		
		// 성빈 : 배열 형태의 ty_code값이 여러번 입력될 경우 해당 recipe 목록을 조회하는 메소드
		@Override
		public ArrayList<RecipeVO> getRecipesByTy_code(String[] ty_code) {
			//Mapper객체 생성 (Mapper는 정의된 메소드 이름을 사용해 Mybatis를 통해 호출할 쿼리문을 찾는다)
			System.out.println(ty_code[0]);
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			
			ArrayList<RecipeVO> recipeList = new ArrayList<RecipeVO>();
			recipeList = recipeMapper.getRecipesByTy_code(ty_code);
			System.out.println(recipeList==null?"null":"not null");
			System.out.println("recipeLsit szie is " + recipeList.size());
			return recipeList;
		}
		
		// (성빈) : MultipartFile 객체를 입력받아 로컬 디렉토리에 저장한 뒤 해당 URL을 리턴하는 메소드
		public String getImgURLByImgFile(MultipartFile mf) {
			
			String URL = null;
			// 저장할 로컬 디렉토리 경로
			String uploadPath = "c:\\upload\\";
			// 파일 확장자 구하기
			String fileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf((".")));
			// 저장할 파일 이름 생성하기
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
			// 파일 저장하기
			try {
				// 타이틀 이미지는 반드시 입력되어야 하기 때문에 이미지가 존재하는지 파일 크기를 체크
				if(mf.getSize() != 0) {
					mf.transferTo(new File(uploadPath + storedFileName));
				}
			} catch (Exception e) {
				System.out.println("SYSTEM  :  레시피 타이틀 이미지 저장 오류 발생, RecipeDAOService; getImgURLByImgFile");
				e.printStackTrace();
			}
			// img 태그에서 불러온 파일 경로
			URL = "madi/upload/"+storedFileName;
			System.out.println("TEMP  :  레시피 타이틀 경로 " + URL);
			return URL;
		}
		
		// (성빈) : MultipartFile 배열 객체를 입력받아 로컬 디렉토리에 저장한 뒤 해당 URL을 리턴하는 메소드
		public String[] getImgURLByImgFiles(MultipartFile[] mf) {
					
			String[] URLs = null;
			System.out.println("SYSTEM  :  레시피 입력, RecipeDAOServcie, getImgURLByImgFiles, 전달받은 이미지 파일의 개수 " + mf.length);
			// 입력받은 파일의 개수가 만큼 URLs 배열 생성 이때 입력되지 않은 파일이 있는 경우에는 해당 url에 null이 입력된다.
			URLs = new String[mf.length];
			System.out.println("SYSTEM  :  레시피 입력, RecipeDAOServcie, getImgURLByImgFiles, 전달받은 이미지 파일의 개수만큼 이미지 URLs 배열을 생성합니다. " + URLs.length);
			// 저장팔 로컬 디렉토리 경로
			String uploadPath = "c:\\upload\\";
			// mf 배열을 루프문을 돌려 각각을 저장하고 각각의 파일 경로를 URLs에 입력하기 위한 루프문
			for (int i = 0; i < mf.length; i++) {
				// 과정 이미지의 경우 입력되지 않는 경우도 있기 때문에 이미지가 존재하는지 파일 크기를 체크하지 않는다
				// 다만, 파일 경로를 기억하는 URLs에는 null값을 주어 recipeDetail에서 해당 파일의 이미지를 로드할 이미지 태그를 생성할 때
				// 파일 유무 체크를 위해 null 값을 준다.
				if(mf[i].getSize() == 0) {
					URLs[i] = "null";
					continue; // 파일이 없을 경우 다음 파일의 작업을 시작한다.
				}
				// mf마다의 파일 확장자 구하기
				String fileExtension = mf[i].getOriginalFilename().substring(mf[i].getOriginalFilename().lastIndexOf((".")));
				System.out.println(mf[i].getOriginalFilename() + " : " +i + "번재");
				// mf 마다의 저장할 파일 이름 생성하기
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
				// 파일 저장하기
				try {
					mf[i].transferTo(new File(uploadPath + storedFileName));
					URLs[i] = "madi/upload/" + storedFileName; // 이미지 태그에서 불러올 파일 경로
				} catch (Exception e) {
					System.out.println("SYSTEM  :  레시피 과정 이미지 저장 오류 발생, RecipeDAOService; getImgURLByImgFiles; index "+i);
					e.printStackTrace();
				}
			}

			return URLs;
		}

		
		// (성빈) : 레시피 재료 입력 메소드
		@Override
		public void insertRecipeIrdnt(RecipeIrdntVO recipeIrdntVO) {
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class);
			try {
				recipeMapper.insertRecipeIrdnt(recipeIrdntVO);
			} catch (Exception e) {
				System.out.println("SYSTEM  :  레시피 재료 입력 오류 발생, RecipeDAOService; insertRecipeIrdnt");
				e.printStackTrace();
			}
		}
		
		// (성빈) : 레시피 과정 입력 메소드

		@Override 
		public void insertRecipeProcess(RecipeProcessVO recipeProcessVO) {
			RecipeMapper recipeMapper = sqlSession.getMapper(RecipeMapper.class); 
			try {
				recipeMapper.insertRecipeProcess(recipeProcessVO);
			} catch (Exception e) {
				System.out.println("SYSTEM  :  레시피 과정 입력 오류 발생, RecipeDAOService; insertRecipeProcess");
				e.printStackTrace();
			}
		}

		// (성빈) : RecipeVO에 담긴 String 배열로부터 RecipeIrdntVO를 만드는 메소드
		public ArrayList<RecipeIrdntVO> getIrdntVOFromRecipeVO(RecipeVO recipeVO) {
			// 리턴할 리스트 객체 생성
			ArrayList<RecipeIrdntVO> recipeIrdntList = new ArrayList<RecipeIrdntVO>();
			
			// 입력된 재료의 총 개수를 구한다 (null값이 있어도 생성되기 때문에 3 배열의 길이가 모두 동일함)
			int length = recipeVO.getIrdnt_name().length;
			// recipeVO로부터 recipeIrdntVO에 담을 배열을 얻는다.
			String[] irdnt_name = recipeVO.getIrdnt_name();
			String[] irdnt_cpcty = recipeVO.getIrdnt_cpcty();
			int[] irdnt_ty_code = recipeVO.getIrdnt_ty_code();
			// 배열의 개수만큼 VO객체를 생성하고 각각의 내용을 동일한 index에 따라 입력해 하나의 VO객체를 완성한다
			for (int i = 0; i < length; i++) {
				RecipeIrdntVO recipeIrdntVO = new RecipeIrdntVO();
				recipeIrdntVO.setIrdnt_name(irdnt_name[i]);
				recipeIrdntVO.setIrdnt_cpcty(irdnt_cpcty[i]);
				recipeIrdntVO.setIrdnt_ty_code(irdnt_ty_code[i]);
				recipeIrdntList.add(recipeIrdntVO);
			}
			
			return recipeIrdntList;
		}

		// (성빈) : RecipeVO에 담긴 String 배열로부터 RecipeProcessVO를 만드는 메소드
		public ArrayList<RecipeProcessVO> getProcessVOFromRecipeVO(RecipeVO recipeVO) {
			// 리턴할 리스트 객체 생성
			ArrayList<RecipeProcessVO> recipeProcessList = new ArrayList<RecipeProcessVO>();
			// 입력한 과정의 총 개수를 구한다
			int length = recipeVO.getCooking_no().length;
			// recipeVO로부터 recipeProcessVO에 담을 배열을 얻는다.
			int[] cooking_no = recipeVO.getCooking_no();
			String[] cooking_desc = recipeVO.getCooking_desc();
			String[] step_img_url = recipeVO.getStep_img_url();
			String[] step_tip = recipeVO.getStep_tip();
			// 배열의 개수만큼 VO객체를 생성하고 각각의 내용을 동일한 idnex에 따라 입력해 하나의 VO객체를 완성한다.
			for (int i = 0; i < length; i++) {
				RecipeProcessVO recipeProcessVO = new RecipeProcessVO();
				recipeProcessVO.setCooking_no(cooking_no[i]);
				recipeProcessVO.setCooking_desc(cooking_desc[i]);
				if(step_tip[i].length() == 0) {
					recipeProcessVO.setStep_tip("null");
				} else {
					recipeProcessVO.setStep_tip(step_tip[i].toString());
				}
				recipeProcessVO.setStep_img_url(step_img_url[i]);
				recipeProcessList.add(recipeProcessVO);
			}
			return recipeProcessList;
		}
		
		// (성빈) 내가 좋아요 한 레시피에 좋아요 했다는 기록 남기기 위한 메서드
		
}

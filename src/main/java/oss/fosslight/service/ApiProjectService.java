/*
 * Copyright (c) 2021 LG Electronics Inc.
 * SPDX-License-Identifier: AGPL-3.0-only 
 */

package oss.fosslight.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import oss.fosslight.domain.UploadFile;

@Service
public interface ApiProjectService {
	public Map<String, Object> selectProjectList(Map<String, Object> paramMap);
	
	public boolean existProjectCnt(Map<String, Object> paramMap);

	public Map<String, Object> getSheetData(UploadFile ufile, String prjId, String readType, String[] sheet);
	
	public Map<String, Object> readAndroidBuildImage(UploadFile ossReportBean, UploadFile noticeHtmlBean, UploadFile resultTxtBean);
	
	public Map<String, Object> selectVerificationCheck(String prjId);
	
	public boolean updatePackageFile(Map<String, Object> paramMap);
	
	public int getCreateProjectCnt(String prjId);
	
	Map<String, Object> createProject(Map<String, Object> paramMap);
	
	public int makeOssNotice(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> getBomList(String prjId);
	
	public List<Map<String, Object>> setMergeGridData(List<Map<String, Object>> list);
	
	public Map<String, Object> getBomCompare(List<Map<String, Object>> beforeBomList, List<Map<String, Object>> afterBomList);
	
	public boolean checkDistributionType(Map<String, Object> paramMap);
	
	public Map<String, Object> selectModelList(Map<String, Object> paramMap);
}

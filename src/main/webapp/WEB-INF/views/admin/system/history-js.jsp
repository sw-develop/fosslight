<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
	/*global $ */
	/*jslint browser: true, nomen: true */
	$(document).ready(function () {
		'use strict';
		
		evt.init();
		data.init();
	});
	
	//데이터 객체
	var data = {
		init : function(){
			list.load();	// Grid Load
		}
	};
	//이벤트 객체
	var evt = {
		init : function(){
			$('#search').on('click',function(e){
				e.preventDefault();
				var beforeDateFormat = new Array();
				// datepicker '.', '-' format remove
				$(".cal").each(function(i,v){beforeDateFormat[i]=v.value;v.value=v.value.replace(/\.|-/gi, '')});

				var postData=$('#historySearch').serializeObject();
				$("#list").jqGrid('setGridParam', {postData:postData, page : 1}).trigger('reloadGrid');
				$(".cal").each(function(i,v){if(v.value != ""){v.value = beforeDateFormat[i];}});
			});
			
			$(".cal").on("keyup", function(e){
				calValidation(this, e);
			});
		}
	};
	
	var list = {
		load : function(){
			$("#list").jqGrid({
				url:"/system/history/listAjax",
				datatype: 'json',
				jsonReader:{
					repeatitems: false,
					id:'idx',
					root:function(obj){return obj.rows;},
					page:function(obj){return obj.pageInfo.curPage;},
					total:function(obj){return obj.pageInfo.totBlockSize;},
					records:function(obj){return obj.pageInfo.totListSize;}
				},
				colNames: ['ID', 'Name', 'Type', 'Action', 'ETC', 'Modifier', 'Modified Date'],
				colModel: [
					{name: 'idx', index: 'idx', width: 40, align: 'center'},
					{name: 'hTitle', index: 'hTitle', width: 200},
					{name: 'hTypeNm', index: 'hTypeNm', width: 80},
					{name: 'hAction', index: 'hAction', width: 80},
					{name: 'hEtc', index: 'hEtc', width: 200, hidden:true},
					{name: 'modifier', index: 'modifier', width: 80, align: 'center'},
					{name: 'modifiedDate', index: 'modifiedDate', width: 100, align: 'center', formatter:'date', formatoptions: {srcformat: 'Y-m-d H:i:s.t', newformat: 'Y-m-d H:i'}}
				],
				rowNum: 20,
				rowList: [20, 40, 60],
	 			autowidth: true,
				pager: '#pager',
				gridview: true,
				sortable: function (permutation) {},
				sortname: 'idx',
				viewrecords: true,
				sortorder: 'desc',
				loadonce:false,
				height: 'auto',
				loadComplete: function() {},
				ondblClickRow: function(rowid,iRow,iCol,e) {
					var rowData = $("#list").jqGrid('getRowData',rowid);
					createTabInFrame('History', '#/system/history/edit/'+rowData['idx']);
				}			
			});
		}
	};
</script>
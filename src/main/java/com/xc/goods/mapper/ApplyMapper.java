package com.xc.goods.mapper;

import com.xc.goods.pojo.Apply;
import com.xc.goods.pojo.ApplyExample;
import com.xc.goods.util.ApplyQueryParams;
import com.xc.goods.util.ApplyResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplyMapper {
    int countByExample(ApplyExample example);

    int deleteByExample(ApplyExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Apply record);

    int insertSelective(Apply record);

    List<Apply> selectByExampleWithBLOBs(ApplyExample example);

    List<Apply> selectByExample(ApplyExample example);

    Apply selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByExampleWithBLOBs(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByExample(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKeyWithBLOBs(Apply record);

    int updateByPrimaryKey(Apply record);
    
    List<Apply> selectApplyList(ApplyQueryParams params);
    /**
     * 根据id查询申请参数
     * @param id
     * @return
     */
    ApplyResult selectApplyQueryParams(Long id);
    
}
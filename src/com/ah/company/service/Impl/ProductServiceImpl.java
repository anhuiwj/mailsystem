package com.ah.company.service.Impl;

import com.ah.company.mapper.FormulaMapper;
import com.ah.company.mapper.InMaterialMapper;
import com.ah.company.mapper.MakeProductMaterialMapper;
import com.ah.company.mapper.MakeProductNumMapper;
import com.ah.company.pojo.InMaterial;
import com.ah.company.pojo.MakeProductMaterial;
import com.ah.company.pojo.MakeProductNum;
import com.ah.company.service.ProductService;
import com.ah.company.vo.FormulaVo;
import com.ah.company.vo.InMaterialVo;
import com.ah.company.vo.MsgVo;
import com.ah.manager.common.page.PageQueryMap;
import com.ah.manager.common.page.model.Pager;
import com.ah.manager.response.JsonResponseEntity;
import com.ah.manager.util.CommonUtil;
import com.ah.manager.util.IdGen;
import com.ah.manager.util.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wangjie on 2017/3/17.
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private MakeProductNumMapper makeProductNumMapper;

    @Autowired
    private FormulaMapper formulaMapper;

    @Autowired
    private InMaterialMapper inMaterialMapper;

    @Autowired
    private MakeProductMaterialMapper makeProductMaterialMapper;

    @Override
    public void findAll(Pager pager) {
        PageQueryMap param = new PageQueryMap(pager);
        if (pager.getParameters() != null) {
            param.putAll(pager.getParameters());
        }
        pager.setExhibitDatas(makeProductNumMapper.findAll(param));
        pager.setIsSuccess(true);           //成功
        pager.setPageCount((pager.getRecordCount() + pager.getPageSize() - 1) / pager.getPageSize());//页数
    }

    @Override
    public JsonResponseEntity save(MakeProductNum makeProductNum) {
        JsonResponseEntity jsonResponseEntity  = new JsonResponseEntity();
        //查询配比公式所需原材料数量
        List<FormulaVo> formulaVos = formulaMapper.findAllFormula(makeProductNum.getFormulaId());
        MsgVo msgVo = pd(formulaVos,makeProductNum);
        MakeProductMaterial makeProductMaterial = null;
        if(msgVo.getOk()==null||msgVo.getOk()){
            if(StringUtils.isEmpty(makeProductNum.getId())){
                makeProductNum.setId(IdGen.uuid());
            }
            makeProductNum.setCreateBy(UserUtils.getCurrentUser().getUsername());
            makeProductNum.setCreateDate(new Date());
            makeProductNumMapper.save(makeProductNum);
            for(InMaterial inMaterial:msgVo.getInMaterialList()){
                inMaterialMapper.inmaterial(inMaterial);//更新库存量
                makeProductMaterial = new MakeProductMaterial();
                makeProductMaterial.setRawMaterialId(inMaterial.getRawMaterialId());
                makeProductMaterial.setMakeProductId(makeProductNum.getId());
                makeProductMaterial.setId(IdGen.uuid());
                makeProductMaterialMapper.save(makeProductMaterial);
            }
            jsonResponseEntity.setCode(CommonUtil.SUCCESS_CODE);
            jsonResponseEntity.setMsg(CommonUtil.ADD_SUCCESS);
        }else{
            jsonResponseEntity.setCode(-1);
            jsonResponseEntity.setMsg(msgVo.getMsg());
        }
        return jsonResponseEntity;
    }

    public MsgVo pd(List<FormulaVo> formulaVos, MakeProductNum makeProductNum){
        MsgVo res = new MsgVo();
        List<InMaterial> inMaterialList = new ArrayList<InMaterial>();
        StringBuffer msg = new StringBuffer();
        InMaterial inMaterial = null;
        for(FormulaVo formulaVo:formulaVos){
            //查询库存所剩原材料数量
            inMaterial =  inMaterialMapper.selectOne(new InMaterial(formulaVo.getMatarialId()));
            /**
             * 判断库存量是否  大于 制作产品数 * 所需原材料数量
             *  1.大于 表示库存足够
             *  2.反之 表示库存不够
             */
            if(inMaterial!=null&&inMaterial.getInNum()>(makeProductNum.getProNum()*formulaVo.getNeedNum())){
                inMaterial.setInNum(inMaterial.getInNum()-(makeProductNum.getProNum()*formulaVo.getNeedNum()));//剩余库存量
                inMaterialList.add(inMaterial);
            }else if(inMaterial!=null&&inMaterial.getInNum()==(makeProductNum.getProNum()*formulaVo.getNeedNum())){
                msg.append("原材料库存不足"+formulaVo.getChinaName());
                inMaterial.setInNum(inMaterial.getInNum()-(makeProductNum.getProNum()*formulaVo.getNeedNum()));//剩余库存量
                inMaterialList.add(inMaterial);
            }else {
                res.setOk(false);
                msg.append("原材料不足"+formulaVo.getChinaName());
                break;
            }
        }
        res.setMsg(msg.toString());
        res.setInMaterialList(inMaterialList);
        return res;
    }

}

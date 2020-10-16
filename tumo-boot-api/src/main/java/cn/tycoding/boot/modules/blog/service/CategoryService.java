package cn.tycoding.boot.modules.blog.service;

import cn.tycoding.boot.common.api.QueryPage;
import cn.tycoding.boot.modules.blog.entity.Category;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 分类表(Category)表服务接口
 *
 * @author tycoding
 * @since 2020-10-14 14:49:15
 */
public interface CategoryService extends IService<Category> {

    /**
     * 条件查询
     */
    List<Category> list(Category category);

    /**
     * 分页、条件查询
     */
    IPage<Category> list(Category category, QueryPage queryPage);

    /**
     * 新增
     */
    void add(Category category);

    /**
     * 修改
     */
    void update(Category category);

    /**
     * 删除
     */
    void delete(Long id);
}
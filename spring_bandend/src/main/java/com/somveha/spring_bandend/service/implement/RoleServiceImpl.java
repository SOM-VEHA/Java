package com.somveha.spring_bandend.service.implement;
import com.somveha.spring_bandend.util.PageUtil;
import java.util.List;
import java.util.Map;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.somveha.spring_bandend.dto.request.RoleRequest;
import com.somveha.spring_bandend.dto.response.RoleResponse;
import com.somveha.spring_bandend.entity.Role;
import com.somveha.spring_bandend.exception.ResourceNotFoundException;
import com.somveha.spring_bandend.mapper.RoleMapper;
import com.somveha.spring_bandend.normalizer.RoleNormalizer;
import com.somveha.spring_bandend.repository.RoleRepository;
import com.somveha.spring_bandend.service.RoleService;
import com.somveha.spring_bandend.specification.RoleSpecification;
import com.somveha.spring_bandend.validator.RoleValidator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequiredArgsConstructor
@Service
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;
    private final RoleMapper roleMapper;
    private final RoleNormalizer roleNormalizer;
    private final RoleValidator roleValidator;

    @Override
    public RoleResponse getById(Long id) {
        ///check data have or not
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        ///to Response
        RoleResponse response=roleMapper.toResponse(role);
        ///return
        return response;
    }

    @Override
    public RoleResponse create(RoleRequest roleRequest) {
        ///log data
         log.info("Create new Role with data: {}", roleRequest);
        ///normali
        roleNormalizer.normalize(roleRequest);
        ///validate
        roleValidator.validate(null,roleRequest);
        ///to entity
        Role entity = roleMapper.toEntity(roleNormalizer.normalize(roleRequest));
        ///save data
        Role save=roleRepository.save(entity);
        ///to Response
        RoleResponse response= roleMapper.toResponse(save);
        ///return
        return response;
    }

    @Override
    public RoleResponse update(RoleRequest roleRequest, Long id) {
        ///log requesr
         log.info("Update Role with data: {}", roleRequest);
        ///normali
        roleNormalizer.normalize(roleRequest);
        ///validation
        roleValidator.validate(id,roleRequest);
        ///check
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        ///to entity
        Role entity=roleMapper.updateEntity(role, roleRequest);
        ///update data
        Role save=roleRepository.save(entity);
        ///to Response
        RoleResponse response= roleMapper.toResponse(save);
        ///return
        return response;
    }

    @Override
    public void delete(Long id) {
        ///check data have or not
        Role role = roleRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Role not found with id: " + id));
        roleRepository.delete(role);
    }

    @Override
    public List<RoleResponse> findByName(Map<String, String> params) {
        ///log params
        log.info("Fetching paginated roles with params: {}", params);
        Specification<Role> spec = RoleSpecification.builderSpecification(params);
        return roleRepository.findAll(spec).stream().map(roleMapper::toResponse).toList();
    }

    @Override
    public Page<RoleResponse> getAll(Map<String, String> params) {
        ///check log of params
         log.info("Fetching paginated roles with params: {}", params);
        ///size limit
        int pageLimit = PageUtil.safeParse(params.get(PageUtil.PAGE_LIMIT), PageUtil.DEFAULT_PAGE_LIMIT);
        ///page number
        int pageNumber = PageUtil.safeParse(params.get(PageUtil.PAGE_NUMBER), PageUtil.DEFAULT_PAGE_NUMBER);
        ///Specification
        Specification<Role> spec = RoleSpecification.builderSpecification(params);
        ///Pageable
        Pageable pageable = PageUtil.getPageable(pageNumber, pageLimit);
        ///check log of pageNumber and pageLimit
         log.info("Fetching Role with params: {}, pageNumber: {}, pageLimit: {}", params, pageNumber, pageLimit);
        ///get alll data
        Page<Role> roles = roleRepository.findAll(spec,pageable);
        ///to response
        Page<RoleResponse> response =roles.map(roleMapper::toResponse);
        ///return
        return response;
    }
}
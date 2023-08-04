/*
 * Copyright 2023 Apollo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.ctrip.framework.apollo.openapi.repository;

import com.ctrip.framework.apollo.openapi.entity.ConsumerRole;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * @author Jason Song(song_s@ctrip.com)
 */
public interface ConsumerRoleRepository extends PagingAndSortingRepository<ConsumerRole, Long> {
  /**
   * find consumer roles by userId
   *
   * @param consumerId consumer id
   */
  List<ConsumerRole> findByConsumerId(long consumerId);

  /**
   * find consumer roles by roleId
   */
  List<ConsumerRole> findByRoleId(long roleId);

  ConsumerRole findByConsumerIdAndRoleId(long consumerId, long roleId);

  @Modifying
  @Query("UPDATE ConsumerRole SET isDeleted = true, deletedAt = ROUND(DATE_PART('EPOCH',now())*1000), dataChangeLastModifiedBy = ?2 WHERE roleId in ?1 and isDeleted = false")
  Integer batchDeleteByRoleIds(List<Long> roleIds, String operator);
}

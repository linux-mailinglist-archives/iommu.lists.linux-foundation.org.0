Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A60379F88
	for <lists.iommu@lfdr.de>; Tue, 11 May 2021 08:05:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791F140581;
	Tue, 11 May 2021 06:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fBqjCWnGOH3E; Tue, 11 May 2021 06:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id B888B40E48;
	Tue, 11 May 2021 06:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4A54C002C;
	Tue, 11 May 2021 06:05:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E93F0C0001;
 Tue, 11 May 2021 06:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAB1B401EE;
 Tue, 11 May 2021 06:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvKjmPA_sunz; Tue, 11 May 2021 06:05:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45921400C3;
 Tue, 11 May 2021 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ivXRfvp0B6bhHcZFQN6o9TvbDYiuEX8y75ZaSbBWqwk=; b=QSMJ3NJ5uT19qxcGuE+coUNmlb
 yT6P0yLS4aW5ugTz7nrlHAL9y157fuXhzFSUDGjN+UGajFuOpst3+7Q1r+IsllWGSvmcMP6zaCnvP
 NuzYBH7oq4UO6oSNuHzUKxsqC7iE7c8x5KwMQF4BOoCGpuvTZc481nEUeO9Pe7T9RXQ0hRiHIuaYA
 7NLXj7mhlAF0i+ESIHahLpUPYelFixQLV64KQdVSBZtyALcQP8r6U7y65kEs5g/sGjSMPZwG7Jpx9
 T+dCLrx/3PVjDzEvBNZ77fqkKCogfLUNvijXg4hBZkvqcZnPA4ZzPU2Z3PeHMAchedaCnpQ8iICd9
 sBsvvTNA==;
Received: from [2001:4bb8:198:fbc8:d27d:cdc6:80b6:b410] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lgLW9-009KPC-7Y; Tue, 11 May 2021 06:05:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>
Subject: RFC: use dma_alloc_noncoherent in ttm_pool_alloc_page
Date: Tue, 11 May 2021 08:05:13 +0200
Message-Id: <20210511060514.3956745-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi all,

the memory allocation for the TTM pool is a big mess with two allocation
methods that both have issues, a layering violation and odd guessing of
pools in the callers.

This patch switches to the dma_alloc_noncoherent API instead fixing all
of the above issues.

Warning:  i don't have any of the relevant hardware, so this is a compile
tested request for comments only!

Diffstat:
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |    1 
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |    4 
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c   |    1 
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c   |    1 
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   |    1 
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   |    1 
 drivers/gpu/drm/drm_cache.c             |   31 -----
 drivers/gpu/drm/drm_gem_vram_helper.c   |    3 
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |    8 -
 drivers/gpu/drm/qxl/qxl_ttm.c           |    3 
 drivers/gpu/drm/radeon/radeon.h         |    1 
 drivers/gpu/drm/radeon/radeon_device.c  |    1 
 drivers/gpu/drm/radeon/radeon_ttm.c     |    4 
 drivers/gpu/drm/ttm/ttm_device.c        |    7 -
 drivers/gpu/drm/ttm/ttm_pool.c          |  178 ++++----------------------------
 drivers/gpu/drm/ttm/ttm_tt.c            |   25 ----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |    4 
 include/drm/drm_cache.h                 |    1 
 include/drm/ttm/ttm_device.h            |    3 
 include/drm/ttm/ttm_pool.h              |    9 -
 20 files changed, 41 insertions(+), 246 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

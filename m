Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3EBAE65D
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 11:11:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48D67E92;
	Tue, 10 Sep 2019 09:11:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13DDEE89
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 09:11:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F91A8AD
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 09:11:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 9816B386; Tue, 10 Sep 2019 11:11:44 +0200 (CEST)
Date: Tue, 10 Sep 2019 11:11:42 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Adam Zerella <adam.zerella@gmail.com>
Subject: Re: [PATCH] iommu/amd: Fix sparse warnings
Message-ID: <20190910091142.GA10821@8bytes.org>
References: <20190907065812.19505-1-adam.zerella@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190907065812.19505-1-adam.zerella@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Sat, Sep 07, 2019 at 04:58:12PM +1000, Adam Zerella wrote:
> There was some simple Sparse warnings related to making some
> signatures static.

And unapplied both of your patches as they causes build failures:

arch/x86/events/amd/iommu.o: In function `perf_iommu_read':
iommu.c:(.text+0xba): undefined reference to `amd_iommu_pc_get_reg'
arch/x86/events/amd/iommu.o: In function `perf_iommu_start':
iommu.c:(.text+0x2df): undefined reference to `amd_iommu_pc_set_reg'
iommu.c:(.text+0x324): undefined reference to `amd_iommu_pc_set_reg'
iommu.c:(.text+0x36b): undefined reference to `amd_iommu_pc_set_reg'
iommu.c:(.text+0x3b0): undefined reference to `amd_iommu_pc_set_reg'
iommu.c:(.text+0x424): undefined reference to `amd_iommu_pc_set_reg'
arch/x86/events/amd/iommu.o:iommu.c:(.text+0x4e4): more undefined references to `amd_iommu_pc_set_reg' follow
arch/x86/events/amd/iommu.o: In function `amd_iommu_pc_init':
iommu.c:(.init.text+0xc): undefined reference to `amd_iommu_pc_supported'
iommu.c:(.init.text+0x131): undefined reference to `get_amd_iommu'
iommu.c:(.init.text+0x140): undefined reference to `amd_iommu_pc_get_max_banks'
iommu.c:(.init.text+0x14f): undefined reference to `amd_iommu_pc_get_max_counters'
drivers/char/agp/intel-gtt.o: In function `intel_gmch_probe':
intel-gtt.c:(.text+0x135d): undefined reference to `intel_iommu_gfx_mapped'
drivers/iommu/amd_iommu_init.o: In function `state_next':
amd_iommu_init.c:(.init.text+0x1ace): undefined reference to `amd_iommu_ops'
drivers/iommu/dmar.o: In function `dmar_parse_one_drhd':
dmar.c:(.text+0x125c): undefined reference to `intel_iommu_ops'
drivers/gpu/drm/i915/intel_device_info.o: In function `intel_device_info_runtime_init':
intel_device_info.c:(.text+0xd89): undefined reference to `intel_iommu_gfx_mapped'
drivers/gpu/drm/i915/gem/i915_gem_stolen.o: In function `i915_gem_init_stolen':
i915_gem_stolen.c:(.text+0x33a): undefined reference to `intel_iommu_gfx_mapped'
drivers/gpu/drm/i915/i915_gem_gtt.o: In function `i915_ggtt_probe_hw':
i915_gem_gtt.c:(.text+0x4f61): undefined reference to `intel_iommu_gfx_mapped'
i915_gem_gtt.c:(.text+0x5127): undefined reference to `intel_iommu_gfx_mapped'
i915_gem_gtt.c:(.text+0x52d1): undefined reference to `intel_iommu_gfx_mapped'
drivers/gpu/drm/i915/i915_gem_gtt.o:i915_gem_gtt.c:(.text+0x53b3): more undefined references to `intel_iommu_gfx_mapped' follow

Please compile-test your patches next time.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

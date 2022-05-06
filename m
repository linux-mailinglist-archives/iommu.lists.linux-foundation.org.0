Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189F51D0B5
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 07:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 279E540A0F;
	Fri,  6 May 2022 05:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id balVOoC04Uog; Fri,  6 May 2022 05:30:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 39A5540533;
	Fri,  6 May 2022 05:30:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05A12C0081;
	Fri,  6 May 2022 05:30:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87956C002D
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 05:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C35B415A8
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 05:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWMrzh-qgaBf for <iommu@lists.linux-foundation.org>;
 Fri,  6 May 2022 05:30:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 732F34157F
 for <iommu@lists.linux-foundation.org>; Fri,  6 May 2022 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651815027; x=1683351027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5UPUZjJVdMzrW2rShCCX+WFC3SvhnCk41EqWtRxsWIE=;
 b=JItjtE5h2SaXLKCLYHuxSb7eMMsfPGYba+keTLnWcYdCS9kbVSEWwwrr
 jYoldxBFF3VMuSwV5GpqqSKbD1YW9cEbilSzx//SXUGzytJkAma134QTk
 +kLQYU9cf2HU84Dy65l6fXzt1pDpQ22/WYBbE7NSm0eaavcDzNIQ2Fgsk
 BTE/bGwAUxouEjoADGWeKNvAXh2wSzjBlKUnK+CBQLUe9mXv1wwfz9r2c
 oqpX7YKaLSQO4zRJSVi/cp4FvATSfTfcSjiv7ptzcuAwFZeVM7Q+keXTs
 JaNtKxMyMW3Tr/TJ4/G3EEBVQqYvMoAV/6UzAPV2+XmW09iSuGpc83AXv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="354790934"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="354790934"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 22:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="695011041"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 22:30:24 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 0/4] iommu/vt-d: Force snooping improvement
Date: Fri,  6 May 2022 13:27:23 +0800
Message-Id: <20220506052727.1689687-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 linux-kernel@vger.kernel.org
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

Hi folks,

Previously, the IOMMU capability of enforcing cache coherency was queried
through iommu_capable(IOMMU_CAP_CACHE_COHERENCY). This is a global
capability, hence the IOMMU driver reports support for this capability
only when all IOMMUs in the system has this support.

Commit 6043257b1de06 ("iommu: Introduce the domain op
enforce_cache_coherency()") converts this into a per-domain test-and-set
option, and the previous iommu_capable(IOMMU_CAP_CACHE_COHERENCY) is
deprecated.

This is a follow-up series which improves the Intel IOMMU driver to
support the per-domain scheme better.

Best regards,
baolu

Change log:
v3:
 - Hold the device_domain_lock when check and set force snooping.
 - Refind the commit messages.

v2:
 - https://lore.kernel.org/linux-iommu/20220505010710.1477739-1-baolu.lu@linux.intel.com/
 - Check whether force_snooping has already been set in
   intel_iommu_enforce_cache_coherency().
 - Set PGSNP pasid bit field during domain attaching if forcing_snooping
   is set.
 - Remove redundant list_empty() checks.
 - Add dmar_domain->set_pte_snp and set it if force snooping is enforced
   on a domain with 2nd-level translation.

v1:
 - https://lore.kernel.org/linux-iommu/20220501112434.874236-1-baolu.lu@linux.intel.com
 - Initial post.

Lu Baolu (4):
  iommu/vt-d: Block force-snoop domain attaching if no SC support
  iommu/vt-d: Check domain force_snooping against attached devices
  iommu/vt-d: Remove domain_update_iommu_snooping()
  iommu/vt-d: Remove hard coding PGSNP bit in PASID entries

 include/linux/intel-iommu.h |  1 +
 drivers/iommu/intel/pasid.h |  2 +
 drivers/iommu/intel/iommu.c | 90 ++++++++++++++++++++++---------------
 drivers/iommu/intel/pasid.c | 26 +++++++++--
 4 files changed, 80 insertions(+), 39 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

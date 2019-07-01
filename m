Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684922A2E
	for <lists.iommu@lfdr.de>; Mon, 20 May 2019 05:02:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA166A7A;
	Mon, 20 May 2019 03:02:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B3E47A9
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 03:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ABEBD7FB
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 03:02:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 20:02:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,490,1549958400"; d="scan'208";a="173475588"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
	by fmsmga002.fm.intel.com with ESMTP; 19 May 2019 20:02:19 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
	(envelope-from <lkp@intel.com>)
	id 1hSYZ8-00023w-Rx; Mon, 20 May 2019 11:02:18 +0800
Date: Mon, 20 May 2019 11:02:17 +0800
From: kbuild test robot <lkp@intel.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: [RFC PATCH] vfio: vfio_iommu_type1: vfio_iommu_type1_caps() can be
	static
Message-ID: <20190520030217.GA48406@lkp-kbuild06>
References: <1558109810-18683-5-git-send-email-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558109810-18683-5-git-send-email-pmorel@linux.ibm.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, sebott@linux.vnet.ibm.com,
	walling@linux.ibm.com, linux-kernel@vger.kernel.org,
	borntraeger@de.ibm.com, iommu@lists.linux-foundation.org,
	kbuild-all@01.org, schwidefsky@de.ibm.com, robin.murphy@arm.com,
	gerald.schaefer@de.ibm.com
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


Fixes: f10b2b74bbea ("vfio: vfio_iommu_type1: implement VFIO_IOMMU_INFO_CAPABILITIES")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vfio_iommu_type1.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 9435647..46a4939 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1704,8 +1704,8 @@ static int vfio_iommu_type1_zpci_grp(struct iommu_domain *domain,
 	return ret;
 }
 
-int vfio_iommu_type1_caps(struct vfio_iommu *iommu, struct vfio_info_cap *caps,
-			  size_t size)
+static int vfio_iommu_type1_caps(struct vfio_iommu *iommu, struct vfio_info_cap *caps,
+				 size_t size)
 {
 	struct vfio_domain *d;
 	unsigned long total_size, fn_size, grp_size;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

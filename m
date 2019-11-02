Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DAECCF4
	for <lists.iommu@lfdr.de>; Sat,  2 Nov 2019 03:56:34 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 872D3E9F;
	Sat,  2 Nov 2019 02:56:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6EAD0E99
	for <iommu@lists.linux-foundation.org>;
	Sat,  2 Nov 2019 02:56:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA78863D
	for <iommu@lists.linux-foundation.org>;
	Sat,  2 Nov 2019 02:56:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2019 19:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,257,1569308400"; d="scan'208";a="226214138"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2019 19:56:26 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/1] MAINTAINERS: Update for INTEL IOMMU (VT-d) entry
Date: Sat,  2 Nov 2019 10:53:11 +0800
Message-Id: <20191102025311.3440-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Update the INTEL IOMMU (VT-d) entry and add myself as the
co-maintainer. I have several years of VT-d development
experience and have actively contributed to Intel VT-d
driver during recent two years. I volunteer to take this
rule. With this role, I can better help review and test
patches.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cba1095547fd..86b999000fcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8299,11 +8299,14 @@ F:	drivers/hid/intel-ish-hid/
 
 INTEL IOMMU (VT-d)
 M:	David Woodhouse <dwmw2@infradead.org>
+M:	Lu Baolu <baolu.lu@linux.intel.com>
 L:	iommu@lists.linux-foundation.org
-T:	git git://git.infradead.org/iommu-2.6.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 S:	Supported
-F:	drivers/iommu/intel-iommu.c
+F:	drivers/iommu/dmar.c
+F:	drivers/iommu/intel*.[ch]
 F:	include/linux/intel-iommu.h
+F:	include/linux/intel-svm.h
 
 INTEL IOP-ADMA DMA DRIVER
 R:	Dan Williams <dan.j.williams@intel.com>
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

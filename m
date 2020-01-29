Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BB14C634
	for <lists.iommu@lfdr.de>; Wed, 29 Jan 2020 06:56:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6EC587EBB;
	Wed, 29 Jan 2020 05:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vvAJ1mAsn1l; Wed, 29 Jan 2020 05:56:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1BE58608F;
	Wed, 29 Jan 2020 05:56:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC383C0881;
	Wed, 29 Jan 2020 05:56:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C7CEC0171
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5AFB086DD6
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTXXQmytpef0 for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 05:56:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A679B86DCC
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 21:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,376,1574150400"; d="scan'208";a="252500707"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2020 21:56:51 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/3] IOMMU user API enhancement
Date: Tue, 28 Jan 2020 22:02:01 -0800
Message-Id: <1580277724-66994-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

IOMMU user API header was introduced to support nested DMA translation and
related fault handling. The current UAPI data structures consist of three
areas that cover the interactions between host kernel and guest:
 - fault handling
 - cache invalidation
 - bind guest page tables, i.e. guest PASID

With future extension in mind, the UAPI structures passed from user to kernel
always starts with a mandatory version field (u32). While this is flexible
for extensions of individual structures, it is difficult to maintain support
of combinations of different version numbers.

This patchset introduces a unified UAPI version number that governs all the
UAPI data structure versions. When userspace query UAPI version for check on
compatibility, a single match would be sufficient.

After UAPI version check, users such as VFIO can also retrieve the matching
data structure size based on version and type. Kernel IOMMU UAPI support is
always backward compatible. Data structures are also only open to extension
and closed to modifications.

The introduction of UAPI version does not change the existing UAPI but rather
simplify the data structure version and size matching.

Thanks,

Jacob

Jacob Pan (3):
  iommu/uapi: Define uapi version and capabilities
  iommu/uapi: Use unified UAPI version
  iommu/uapi: Add helper function for size lookup

 drivers/iommu/intel-iommu.c |  3 ++-
 drivers/iommu/intel-svm.c   |  2 +-
 drivers/iommu/iommu.c       | 25 +++++++++++++++++++-
 include/linux/iommu.h       |  6 +++++
 include/uapi/linux/iommu.h  | 57 ++++++++++++++++++++++++++++++++++++++++-----
 5 files changed, 84 insertions(+), 9 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

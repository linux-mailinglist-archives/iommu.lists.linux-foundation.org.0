Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4B18A4B7
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 21:57:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 367E286248;
	Wed, 18 Mar 2020 20:57:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3D6wbrxUimq; Wed, 18 Mar 2020 20:57:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA5228630F;
	Wed, 18 Mar 2020 20:57:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A502FC013E;
	Wed, 18 Mar 2020 20:57:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C6C6C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 838F0869C7
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mp1DxiTCrUhO for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 20:57:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E7233874DA
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 20:57:01 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12E6020BED;
 Wed, 18 Mar 2020 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584565021;
 bh=Hv4hSMvpfN+LKV5X3UisRwpdnw220sQeTZY7RQMEfz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLc1X39Wt705wwp/cUSLcTcbR4DkUybNJsfI1YjJK1RoXSvwmw1zoJMfsnOwPmfMy
 +MrEJshfQA4ooa3xkh3LCwPiQprra5doOdMSKdH5MBb2Ma6JMPdYwFZE+gIXhe91ph
 qr6hnZzGF7ze5DN6LvfxFdlFDKR2W5PqRRo+kIzI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 11/12] iommu/vt-d: quirk_ioat_snb_local_iommu:
 replace WARN_TAINT with pr_warn + add_taint
Date: Wed, 18 Mar 2020 16:56:47 -0400
Message-Id: <20200318205648.17937-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205648.17937-1-sashal@kernel.org>
References: <20200318205648.17937-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 81ee85d0462410de8eeeec1b9761941fd6ed8c7b ]

Quoting from the comment describing the WARN functions in
include/asm-generic/bug.h:

 * WARN(), WARN_ON(), WARN_ON_ONCE, and so on can be used to report
 * significant kernel issues that need prompt attention if they should ever
 * appear at runtime.
 *
 * Do not use these macros when checking for invalid external inputs

The (buggy) firmware tables which the dmar code was calling WARN_TAINT
for really are invalid external inputs. They are not under the kernel's
control and the issues in them cannot be fixed by a kernel update.
So logging a backtrace, which invites bug reports to be filed about this,
is not helpful.

Fixes: 556ab45f9a77 ("ioat2: catch and recover from broken vtd configurations v6")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20200309182510.373875-1-hdegoede@redhat.com
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=701847
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index a2005b82ec8ff..3a97225d0b182 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3949,10 +3949,11 @@ static void quirk_ioat_snb_local_iommu(struct pci_dev *pdev)
 
 	/* we know that the this iommu should be at offset 0xa000 from vtbar */
 	drhd = dmar_find_matched_drhd_unit(pdev);
-	if (WARN_TAINT_ONCE(!drhd || drhd->reg_base_addr - vtbar != 0xa000,
-			    TAINT_FIRMWARE_WORKAROUND,
-			    "BIOS assigned incorrect VT-d unit for Intel(R) QuickData Technology device\n"))
+	if (!drhd || drhd->reg_base_addr - vtbar != 0xa000) {
+		pr_warn_once(FW_BUG "BIOS assigned incorrect VT-d unit for Intel(R) QuickData Technology device\n");
+		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
 		pdev->dev.archdata.iommu = DUMMY_DEVICE_DOMAIN_INFO;
+	}
 }
 DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_IOAT_SNB, quirk_ioat_snb_local_iommu);
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

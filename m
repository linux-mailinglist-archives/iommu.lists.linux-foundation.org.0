Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588F99729
	for <lists.iommu@lfdr.de>; Thu, 22 Aug 2019 16:43:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5DAED90;
	Thu, 22 Aug 2019 14:43:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6736CDB
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 14:29:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6CB348AC
	for <iommu@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 14:29:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2019 07:29:49 -0700
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="178873789"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.17])
	by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2019 07:29:47 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [RFC PATCH] iommu/vt-d: Fix IOMMU field not populated on device hot
	re-plug
Date: Thu, 22 Aug 2019 16:29:22 +0200
Message-Id: <20190822142922.31526-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 22 Aug 2019 14:43:46 +0000
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	iommu@lists.linux-foundation.org,
	intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
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

When a perfectly working i915 device is hot unplugged (via sysfs) and
hot re-plugged again, its dev->archdata.iommu field is not populated
again with an IOMMU pointer.  As a result, the device probe fails on
DMA mapping error during scratch page setup.

It looks like that happens because devices are not detached from their
MMUIO bus before they are removed on device unplug.  Then, when an
already registered device/IOMMU association is identified by the
reinstantiated device's bus and function IDs on IOMMU bus re-attach
attempt, the device's archdata is not populated with IOMMU information
and the bad happens.

I'm not sure if this is a proper fix but it works for me so at least it
confirms correctness of my analysis results, I believe.  So far I
haven't been able to identify a good place where the possibly missing
IOMMU bus detach on device unplug operation could be added.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 12d094d08c0a..7cdcd0595408 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2477,6 +2477,9 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 		if (info2) {
 			found      = info2->domain;
 			info2->dev = dev;
+
+			if (dev && !dev->archdata.iommu)
+				dev->archdata.iommu = info2;
 		}
 	}
 
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

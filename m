Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178721E206
	for <lists.iommu@lfdr.de>; Mon, 13 Jul 2020 23:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB2C2881E5;
	Mon, 13 Jul 2020 21:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVIGtImKo5lH; Mon, 13 Jul 2020 21:26:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42ED787FB9;
	Mon, 13 Jul 2020 21:26:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30FD5C0888;
	Mon, 13 Jul 2020 21:26:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47BC6C0733
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C32489E6E
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PxxXi3BP8H8 for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 21:26:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 93ECE89EB4
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jul 2020 21:26:28 +0000 (UTC)
IronPort-SDR: OyE11e4uaZeMnB16yacM7fpFCX+9eA3V/LWqmC9pScLV/XErxY71wTE64EYaFImHV8hiDrm5IN
 rhxzb9T7aYOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="210271606"
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="210271606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 14:26:27 -0700
IronPort-SDR: wl6dTmbNOz5n9G3weeYoKBT1IgauYfprPYVf8slN86O+c9kPvftuaseYdwg/g/Gm0/gS+0CdwF
 MBp6gZHTxhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="285534434"
Received: from lkp-server02.sh.intel.com (HELO fb03a464a2e3) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 13 Jul 2020 14:26:25 -0700
Received: from kbuild by fb03a464a2e3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jv5xw-0000zQ-Cf; Mon, 13 Jul 2020 21:26:24 +0000
Date: Tue, 14 Jul 2020 05:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [RFC PATCH] iommu/arm-smmu: arm_smmu_setup_identity() can be static
Message-ID: <20200713212530.GA87620@1f5a2ab6ad98>
References: <20200709050145.3520931-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709050145.3520931-2-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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


Signed-off-by: kernel test robot <lkp@intel.com>
---
 arm-smmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 2e27cf9815ab6..fb85e716ae9ac 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1924,7 +1924,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
+static int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
 {
 	int i;
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 171AE2DDFFB
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 09:39:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F26787836;
	Fri, 18 Dec 2020 08:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBPFqWg0ATy9; Fri, 18 Dec 2020 08:39:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABFDA877C0;
	Fri, 18 Dec 2020 08:39:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F3E1C0893;
	Fri, 18 Dec 2020 08:39:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 792ACC0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6BF1F86FF0
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L82faM0hh-PX for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 08:39:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D408986160
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:39:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608280753; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1FjPyQUiEQRFSNgMgFxEduBUw7HO1HzLVIZtFQNj/zM=;
 b=qVyr+jVBHW+dL/SOcH+XxeogKOnYXATWG714PNN5PikYB/Smjs751JC94xlX+GleeGBZjqW6
 AYm8gqOD31aFfp0kQ0JKZYWWMANzYm41hpGTFRkV/8UmPHIP+Sn9eJt1gAeqOjAWnxG7JAP0
 zYG+onlYeIktA/Wp8Nxtfbo/NT8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fdc6aa575ab652e87e926d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 08:39:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87003C43464; Fri, 18 Dec 2020 08:39:01 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 696AEC433CA;
 Fri, 18 Dec 2020 08:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 696AEC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] iommu: Permit modular builds of io-pgtable drivers
Date: Fri, 18 Dec 2020 00:38:39 -0800
Message-Id: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 pdaly@codeaurora.org, will@kernel.org, robin.murphy@arm.com,
 pratikp@codeaurora.org
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

The goal of the Generic Kernel Image (GKI) effort is to have a common
image that works across multiple Android devices. This involves generating
a kernel image that has core features integrated into it, while SoC specific
functionality can be added to the kernel for the device as a module.

Along with modularizing IOMMU drivers, this also means building the io-pgtable
code as modules, which allows for SoC vendors to only include the io-pgtable
implementations that they use. For example, GKI for arm64 must include
support for both the IOMMU ARM LPAE/V7S formats at the moment. Having the code
for both formats as modules allows SoC vendors to only provide the page table
format that they use, along with their IOMMU driver.

Modularizing both io-pgtable.c, as well as the io-pgtable-arm[-v7s].c files,
works out rather nicely, as the main interface that clients use to interact
with the page tables is already exported (i.e. alloc_io_pgtable_ops and
free_io_pgtable_ops). It also makes it so that neither the io-pgtable-arm[-v7s]
modules or the io-pgtable modules can be unloaded without unloading the IOMMU
driver, which can only happen when there aren't any references to the IOMMU
driver module.

Thanks in advance for the feedback,

Isaac J. Manjarres

Isaac J. Manjarres (3):
  iommu/io-pgtable-arm: Prepare for modularization
  iommu/io-pgtable: Prepare for modularization
  iommu/io-pgtable: Allow building as a module

 drivers/iommu/Kconfig              | 6 +++---
 drivers/iommu/io-pgtable-arm-v7s.c | 4 ++++
 drivers/iommu/io-pgtable-arm.c     | 8 ++++++++
 drivers/iommu/io-pgtable.c         | 7 +++++--
 4 files changed, 20 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

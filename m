Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9514C2C9
	for <lists.iommu@lfdr.de>; Tue, 28 Jan 2020 23:16:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 838A584C13;
	Tue, 28 Jan 2020 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfYsmE7yY433; Tue, 28 Jan 2020 22:16:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09E0585DC1;
	Tue, 28 Jan 2020 22:16:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC11BC0171;
	Tue, 28 Jan 2020 22:16:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30F4CC0175
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1FF4286D81
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Us5KIMC+hUDN for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jan 2020 22:16:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 28ABF81153
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jan 2020 22:16:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580249786; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FXsf/z/1DeoIKgsAIM/dfI6zvYtWCIvxuwhvpm/1k8o=;
 b=ZVmHpKGELq4ZaxUdn6WwqeoylJfxXVdwq7+UvF9uRbQDJZ7MZF3zGXsBRpoVBJIJ18s/lnOc
 IWfYdjdkisNfYRreAkbQX0G8GkdH2rRY0JXL1BqzZfq5fTPlnHuBIx9W/n+SDT3T2FDCdzSb
 KftworpE4TJwstWZvSR6q1enV+A=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b2b3.7f5599666dc0-smtp-out-n02;
 Tue, 28 Jan 2020 22:16:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4E8FAC447A2; Tue, 28 Jan 2020 22:16:19 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29111C433A2;
 Tue, 28 Jan 2020 22:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29111C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v1 1/6] iommu: Add DOMAIN_ATTR_PTBASE
Date: Tue, 28 Jan 2020 15:16:05 -0700
Message-Id: <1580249770-1088-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
Cc: robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Add an attribute to return the base address of the pagetable. This is used
by auxiliary domains from arm-smmu to return the address of the pagetable
to the domain so that it can set the appropriate pagetable through it's
own means.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b14398b..0e9bcd9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -128,6 +128,8 @@ enum iommu_attr {
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
 	/* Enable split pagetables (for example, TTBR1 on arm-smmu) */
 	DOMAIN_ATTR_SPLIT_TABLES,
+	/* Return the pagetable base address */
+	DOMAIN_ATTR_PTBASE,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu

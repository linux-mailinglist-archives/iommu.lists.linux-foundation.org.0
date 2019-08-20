Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB16968F1
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 21:07:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F853D0A;
	Tue, 20 Aug 2019 19:06:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 083F9C79
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:44 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB8C512E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id A7B8F61155; Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328003;
	bh=+6w/KwG2LYGoBrIRsU609ZfylF5tzSCWZ9Tuvd8PIfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgVEfFgGDG1IbPnat3dicEvXT3N8r9lx6wQF57rhdBUnbG5G5hq1ZKmorgALQrxsy
	nUYRvmxx13e0XjG8BBLAPNfH1T5imBQXTzs+mrbjA8rDQwBgjLFeYTKNWBd7m2w4ic
	Jr0rr01UC1noThxVjIk7Is0m/T/nBSY8plnEHsYs=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D68FD60FE9;
	Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328003;
	bh=+6w/KwG2LYGoBrIRsU609ZfylF5tzSCWZ9Tuvd8PIfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgVEfFgGDG1IbPnat3dicEvXT3N8r9lx6wQF57rhdBUnbG5G5hq1ZKmorgALQrxsy
	nUYRvmxx13e0XjG8BBLAPNfH1T5imBQXTzs+mrbjA8rDQwBgjLFeYTKNWBd7m2w4ic
	Jr0rr01UC1noThxVjIk7Is0m/T/nBSY8plnEHsYs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D68FD60FE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 4/7] iommu: Add DOMAIN_ATTR_SPLIT_TABLES
Date: Tue, 20 Aug 2019 13:06:29 -0600
Message-Id: <1566327992-362-5-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
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

Add a new attribute to query the state of split pagetables for the domain.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 include/linux/iommu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index fdc355c..b06db6c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -125,6 +125,7 @@ enum iommu_attr {
 	DOMAIN_ATTR_FSL_PAMUV1,
 	DOMAIN_ATTR_NESTING,	/* two stages of translation */
 	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
+	DOMAIN_ATTR_SPLIT_TABLES,
 	DOMAIN_ATTR_MAX,
 };
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
